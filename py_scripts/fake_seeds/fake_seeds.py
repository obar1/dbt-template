import argparse
import random
import string
from dataclasses import dataclass
from typing import List
import pandas as  pd
import csv 
import exrex

DUCKDB = 'duckdb'

BIGQUERY = 'bigquery'

CSV_SUFFFIX='.csv'
DB_ID_COLUMN = 'db_id'
SEED_METADATA_PREFIX = '$metadata_'
SEED_DATA_PREFIX = '$moke_'
SEP = ','
SEP_PIPE = '|'
N_ROWS = 10 #TODO 
# TODO: as arg par

@dataclass
class ColumnRecord:
    """
    column_name, column_type and extra as fields from metadata
    """
    column_name:str 
    column_type: str
    extra: str

def parse_input():
    """parse_input

    Raises:
        Exception: if csv is not used
    """
    parser = argparse.ArgumentParser()
    parser.add_argument('fn_metadata')
    args = parser.parse_args()
    if CSV_SUFFFIX not in args.fn_metadata :
        raise Exception('use csv export as in readme')
    return args
    
def make_seeds_from_bigquery(df):
    print('make_seeds_from_bigquery')
    df['ttt'] = df[['table_catalog', 'table_schema','table_name']].agg(lambda x: '.'.join(x.values), axis=1)
    tables : dict = {}
    for row in df.itertuples():
        print(row.ttt)
        cr = ColumnRecord(column_name= row.column_name, column_type=row.data_type,  extra= row.extra if pd.notnull(row.extra) else None)
        ttt = row.ttt
        if  tables.get(ttt) is None:
            tables[ttt]= [] # init as empty list
        tables[ttt].append(cr) # add cr found
    return tables

def generate_seed_metadata(fn_seed, column_records: List[ColumnRecord]):
    """generate_seed_metadata
    TODO:
    """
    df = pd.DataFrame(column_records)
    fn_seed = SEED_METADATA_PREFIX + fn_seed
    df.to_csv(fn_seed, index=False,sep=SEP, encoding='utf-8')




def get_rnd_data(cr: ColumnRecord, db_id, n_rows=N_ROWS) -> List[str]:
    def _get_rnd_data_no_extra(cr: ColumnRecord, db_id):
        if db_id==BIGQUERY:
            if cr.column_type == "INT64":
                return random.randint(0,100)
            if cr.column_type == "NUMERIC":
                return random.uniform(0,100)
            if cr.column_type == "STRING":
                return "".join(random.choice(string.ascii_letters) for _ in range(10))
        elif db_id==DUCKDB:
            if cr.column_type == "BIGINT":
                return random.randint(0,100)
            if cr.column_type == "DOUBLE":
                return random.uniform(0,100)
            if cr.column_type == "VARCHAR":
                return "".join(random.choice(string.ascii_letters) for _ in range(10))
        else:
            raise ValueError(f'{db_id} not supported')

    def  _get_rnd_data_with_extra(cr: ColumnRecord,  db_id,sep=SEP_PIPE):
        """supported 
        pattern
        list 
        range

        Parameters
        ----------
        db_id
        """
        extra : str = cr.extra
        if  cr.extra != None:
            if "pattern=" in extra:
                pattern:  str = extra.split("pattern=")[1]
                return exrex.getone(pattern)
            if "list=" in extra:
                options: List[str] = extra.split("list=")[1].split(sep)
                return random.choice(options)
            if "range=" in extra:
                min, max= extra.split("range=")[1].split(sep)
                return random.randint(int(min), int(max))
        return _get_rnd_data_no_extra(cr,db_id)
    res = []
    for i in range(0, n_rows):
        if cr.extra != None:
            res.append(_get_rnd_data_with_extra(cr,db_id))
        else:
            res.append(_get_rnd_data_no_extra(cr,db_id))
    return res
        
def generate_seed_data(fn_seed, column_records: List[ColumnRecord], db_id):
    """generate_seed_data
    TODO:

    Parameters
    ----------
    db_id
    """
    df = pd.DataFrame(column_records)
    fn_seed = SEED_DATA_PREFIX + fn_seed
    seed_data = {}
    for cr in column_records:
        seed_data[cr.column_name] = get_rnd_data(cr, db_id, N_ROWS)
    print(seed_data)
    ts = list(zip(*seed_data.values())) # trick to get mapped
    with open(fn_seed, 'w', newline='') as f:
        writer= csv.writer(f)
        writer.writerow(seed_data.keys())
        for r in ts:
            writer.writerow(r)
        
    
    
def  generate_seeds(tables: dict, db_id):
    
    def _get_fn_seed(k: str):
        return k.lower().replace(',','_').replace('-','_') + CSV_SUFFFIX
    
    for k,v in tables.items():
        column_records: List[ColumnRecord] = v
        fn_seed: str = _get_fn_seed(k)
        
        print(f"Working on {k}...")
        generate_seed_metadata(fn_seed, column_records)
        generate_seed_data(fn_seed, column_records,db_id)

def check_metadata(args):
    df = pd.read_csv(args.fn_metadata)
    if DB_ID_COLUMN not in df.columns :
        raise Exception('use sql export snippets as in readme')
    
    return df['db_id'].unique().take(0) ,df

if __name__== "__main__":
    parsed = parse_input()
    db_id, df = check_metadata(parsed)
    tables = make_seeds_from_bigquery(df)
    generate_seeds(tables,db_id)
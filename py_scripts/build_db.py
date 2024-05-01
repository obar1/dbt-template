import duckdb

def load_ics_edu_datasets():
    with duckdb.connect('db.duckdb') as db_conn:
        for sample_dataset in ['population_by_zip_2000'  ,'population_by_zip_2010']:
            url_ddl = "CREATE OR REPLACE TABLE {} AS FROM read_csv_auto('./data/{}.csv')".format(sample_dataset,sample_dataset)
            print(f'loading {sample_dataset} from {url_ddl}')
            db_conn.execute(url_ddl)
            print(f'loaded {sample_dataset}')

        some_ddl = "CHECKPOINT;"
        db_conn.execute(some_ddl)

if __name__=='__main__':
    load_ics_edu_datasets()
    
    
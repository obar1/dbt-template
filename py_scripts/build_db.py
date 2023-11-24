import duckdb

con = duckdb.connect('db.duckdb')
con.execute("CREATE OR REPLACE TABLE iris_raw AS FROM read_csv_auto('http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data')")
con.close()
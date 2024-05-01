venv0:
	python -m venv .venv
	
install0:
	pip install --upgrade pip && pip install -r requirements.txt

loaddb0:
	python py_scripts/build_db.py 

connectdb0:
	duckcli db.duckdb 	


build0:
	dbt build --vars '{MODE:  DEV}' --full-refresh
build1:
	dbt build --vars '{MODE:  DEV}'

run:
	dbt run --full-refresh

format:
	sqlfluff fix -f 



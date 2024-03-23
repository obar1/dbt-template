venv0:
	python -m venv .venv

loaddb0:
	python py_scripts/build_db.py 

connectdb0:
	duckcli db.duckdb 	

install:
	pip install --upgrade pip && pip install -r requirements.txt

qa:
	dbt build --vars '{MODE:  QA}'

run0:
	dbt build --vars '{MODE:  DEV}' --full-refresh
run1:
	dbt run --vars '{MODE:  DEV}'

format:
	sqlfluff fix -f 



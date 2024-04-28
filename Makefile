.PHONY: venv0

venv0:
	python -m venv .venv && . .venv/bin/activate && pip install --upgrade pip && pip install -r requirements.txt && echo ". .venv/bin/activate" 

loaddb0:
	python py_scripts/build_db.py 
connectdb0:
	duckcli db.duckdb 	

format:
	sqlfluff fix -f

qa:
	dbt build --vars '{MODE:  QA}' --full-refresh
run0:
	dbt build --vars '{MODE:  DEV}' --full-refresh
run1:
	dbt run --vars '{MODE:  DEV}'

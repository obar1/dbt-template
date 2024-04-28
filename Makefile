venv0:
	python -m venv .venv && echo ". .venv/bin/activate"
install0:
	pip install --upgrade pip && pip install -r requirements.txt
loaddb0:
	python py_scripts/build_db.py 
connectdb0:
	duckcli db.duckdb 	
qa:
	dbt build --vars '{MODE:  QA}' --full-refresh
run0:
	dbt build --vars '{MODE:  DEV}' --full-refresh
run1:
	dbt run --vars '{MODE:  DEV}'
format:
	sqlfluff fix -f
venv0:
	python -m venv .venv

loaddb0:
	echo 'build db.duckdb'

connectdb0:
	duckcli db.duckdb 	

install:
	pip install --upgrade pip && pip install -r requirements.txt

test:
	dbt test

run:
	dbt run

format:
	sqlfluff lint



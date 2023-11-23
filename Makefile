venv0:
	python -m venv .venv

install:
	pip install --upgrade pip && pip install -r requirements.txt

test:
	dbt test

format:
	sqlfluff

run:
	dbt run

venv0:
	python -m venv .venv
	
install:
	pip install --upgrade pip && pip install -r requirements.txt

test:
	dbt test

run:
	dbt run

format:
	# sqlfluff fix --dialect duckdb --force --templater=jinja .
	echo 'TODO:'


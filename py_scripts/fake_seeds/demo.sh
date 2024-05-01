python -m venv .venv
. .venv/bin/activate
pip install -r ../../requirements.txt

python fake_seeds.py duckdb-metadata-export.csv   10000
python fake_seeds.py bigquery-metadata-export.csv 10000

python3 -m venv .venv
source .venv/bin/activate

gunicorn --bind 0.0.0.0:5000 app:app
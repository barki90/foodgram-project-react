FROM python:3.7-slim

WORKDIR /app

COPY requirements.txt /app

RUN pip3 install -r /app/requirements.txt --no-cache-dir

COPY backend/ /app

CMD ["gunicorn", "backend.wsgi:application", "--bind", "0:8000" ]

# [Unit]
# Description=gunicorn daemon
#
# After=network.target
#
# [Service]
# User=barki91
#
# WorkingDirectory=/home/barki91/foodgram-project-react/backend/
#
# ExecStart=/home/barki91/foodgram-project-react/venv/Scripts/gunicorn --bind 127.0.0.1:8000 backend.wsgi:application
#
# [Install]
# WantedBy=multi-user.target
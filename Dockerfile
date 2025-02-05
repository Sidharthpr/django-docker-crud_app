FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

# Install wait-for-it script
ADD https://github.com/vishnubob/wait-for-it/raw/master/wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

# Modify entrypoint to wait for database
CMD /wait-for-it.sh database:5432 -- python manage.py migrate && python manage.py runserver 0.0.0.0:8000
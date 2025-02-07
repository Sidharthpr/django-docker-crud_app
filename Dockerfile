FROM python:3.11-slim

WORKDIR /app

# Install system dependencies - note the additional packages
RUN apt-get update && apt-get install -y \
    binutils \
    gdal-bin \
    libproj-dev \
    postgresql-client \
    python3-gdal \
    libgdal-dev \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Set GDAL environment variables
ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
ENV C_INCLUDE_PATH=/usr/include/gdal

# Install GDAL Python bindings first
RUN pip install GDAL==$(gdal-config --version) --no-cache-dir

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ADD https://github.com/vishnubob/wait-for-it/raw/master/wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

CMD ["/wait-for-it.sh", "database:5432", "--", "sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
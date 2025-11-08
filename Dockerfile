# Use official lightweight Python image
FROM python:3.11-slim

# Allow statements and log messages to appear immediately
ENV PYTHONUNBUFFERED=True

# Set working directory
WORKDIR /app

# Copy files
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Use gunicorn for production
CMD exec gunicorn --bind :8080 --workers 2 main:app

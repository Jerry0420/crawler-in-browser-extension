FROM python:3.9.7-alpine AS builder
WORKDIR /app
COPY requirements.txt /app/
RUN pip install -r requirements.txt --no-cache-dir

FROM builder AS main
ENV PYTHONUNBUFFERED=1
EXPOSE 8000
WORKDIR /app
COPY . .
# ENTRYPOINT /app/main
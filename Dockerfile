FROM python:3.12-slim

LABEL org.opencontainers.image.source="https://github.com/idp-skripsi/dev-py-00-app"

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

RUN useradd --create-home appuser

COPY app/ ./app/

USER appuser

EXPOSE 8000

CMD ["sh", "-c", "exec uvicorn app.main:app --host 0.0.0.0 --port ${PORT:-8000}"]
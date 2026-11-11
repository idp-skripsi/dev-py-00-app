FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Salin requirements dulu agar layer cache bekerja
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Buat user non-root
RUN useradd --create-home appuser

# Salin kode aplikasi
COPY app/ ./app/

USER appuser

EXPOSE 8000

CMD ["sh", "-c", "exec uvicorn app.main:app --host 0.0.0.0 --port ${PORT:-8000}"]
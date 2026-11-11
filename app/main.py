import os
from fastapi import FastAPI

SERVICE_NAME = os.getenv("SERVICE_NAME", "python-api")
API_VERSION = os.getenv("API_VERSION", "1.0.0")

app = FastAPI(
    title="Product catalog API",
    description="This is a sample FastAPI microservice.",
    version=API_VERSION,
)

@app.get("/")
def root():
    return {"message": "Welcome to the Product catalog API!"}

@app.get("/version")
def version():
    return{"service" : SERVICE_NAME, "version": API_VERSION}

@app.get("/healthz")
def health():
    return {"status": "healthy"}

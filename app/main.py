from fastapi import FastAPI
import socket
import os

app = FastAPI()

@app.get("/")
def home():
    return {
        "message": "Hello from AWS ECS Fargate!",
        "hostname": socket.gethostname(),
        "environment": os.getenv("ENV", "dev")
    }

@app.get("/health")
def health():
    return {"status": "healthy"}
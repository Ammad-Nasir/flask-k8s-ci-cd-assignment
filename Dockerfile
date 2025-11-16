# Stage 1 - Build
FROM python:3.10-slim as builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2 - Runtime
FROM python:3.10-slim
WORKDIR /app
COPY --from=builder /usr/local/lib/python3.10 /usr/local/lib/python3.10
COPY app.py .
EXPOSE 5000
CMD ["python", "app.py"]

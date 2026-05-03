FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY service/ ./service/

EXPOSE 8080

ENV FLASK_APP=service:app
ENV DATABASE_URI=sqlite:///test.db

CMD ["gunicorn", "--bind=0.0.0.0:8080", "--log-level=info", "service:app"]

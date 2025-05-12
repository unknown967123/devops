FROM python:3.13.2-slim
WORKDIR /app
COPY Fi.py /app

CMD ["python","Fi.py"]
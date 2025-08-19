# Use Python base image
FROM python:3.9-slim

# Set work directory
WORKDIR /app

# Copy requirement files and install
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy app code
COPY app.py .

# Expose port
EXPOSE 5000

# Run app
CMD ["python", "app.py"]

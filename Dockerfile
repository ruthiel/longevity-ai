# Use Python 3.11 slim image for better performance
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies (if needed for any Python packages)
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better Docker layer caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Create a non-root user for security
RUN adduser --disabled-password --gecos '' appuser && \
    chown -R appuser:appuser /app
USER appuser

# Expose port (adjust if your app uses a different port)
EXPOSE 8000

# Default command (adjust based on your main script)
CMD ["python", "main.py"]
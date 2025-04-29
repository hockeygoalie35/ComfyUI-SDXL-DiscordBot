FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies if needed (minimal now)
RUN apt-get update && apt-get install -y --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

# Copy your application code
COPY . .
RUN chmod +x ./docker/entrypoint.sh
# Install Python dependencies
RUN pip install --no-cache-dir -r ./requirements.txt

# Set the entrypoint
ENTRYPOINT ["./docker/entrypoint.sh"]
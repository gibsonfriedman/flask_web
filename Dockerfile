FROM python:3.9-slim

# Use LABEL for maintainer information
LABEL maintainer="gfriedman25@lambda.compute.cmc.edu"
# Install system dependencies (if any are required)
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends build-essential && \
    rm -rf /var/lib/apt/lists/*

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]

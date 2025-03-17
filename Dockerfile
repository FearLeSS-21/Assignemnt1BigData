# Use Ubuntu as base image
FROM ubuntu:latest

# Set non-interactive mode for installations
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies and Python 3
RUN apt-get update && apt-get install -y \
    python3 python3-pip python3-venv \
    python3-dev python3-setuptools \
    build-essential gfortran \
    libatlas-base-dev libopenblas-dev liblapack-dev \
    && rm -rf /var/lib/apt/lists/*  # Clean up to reduce image size

# Create a virtual environment and install packages inside it
RUN python3 -m venv /home/doc-bd-a1/venv \
    && /home/doc-bd-a1/venv/bin/pip install --upgrade pip \
    && /home/doc-bd-a1/venv/bin/pip install pandas numpy seaborn matplotlib scikit-learn scipy

# Create directory inside container
RUN mkdir -p /home/doc-bd-a1/

# Copy dataset to container
COPY Titanic-Dataset.csv /home/doc-bd-a1/Titanic-Dataset.csv

# Set working directory
WORKDIR /home/doc-bd-a1/

# Activate virtual environment when the container starts
CMD ["/bin/bash", "-c", "source /home/doc-bd-a1/venv/bin/activate && exec bash"]

## Overview

This Dockerfile defines the environment and configuration for containerizing the Flask Bookstore API application.

## Dockerfile Details

### Base Image

The Dockerfile starts with the official Python 3.9 slim image as the base:

```dockerfile
FROM python:3.9-slim
```

### Working Directory

Sets the working directory inside the container:

```dockerfile
WORKDIR /app
```

### Copy Application Files

Copies the current directory contents (local files) into the container at `/app`:

```dockerfile
COPY . /app
```

### Install Dependencies

Installs required Python packages specified in `requirements.txt`:

```dockerfile
RUN pip install --no-cache-dir -r requirements.txt
```

### Expose Port

Exposes port 5000 to allow communication with the Flask application:

```dockerfile
EXPOSE 5000
```

### Environment Variable

Sets the `FLASK_APP` environment variable to `app.py`, specifying the entry point for the Flask application:

```dockerfile
ENV FLASK_APP=app.py
```

### Command to Run the Application

Defines the command to run when the container starts, which starts the Flask application:

```dockerfile
CMD ["flask", "run", "--host=0.0.0.0"]
```

## Building the Docker Image

To build the Docker image locally, run the following command in the directory containing your Dockerfile:

```bash
docker build -t flask-bookstore-api .
```

## Running the Docker Container

After building the Docker image, run the container using the following command:

```bash
docker run -p 5000:5000 flask-bookstore-api
```

This command maps port 5000 of the container to port 5000 on your local machine, allowing you to access the Flask application at `http://localhost:5000`.

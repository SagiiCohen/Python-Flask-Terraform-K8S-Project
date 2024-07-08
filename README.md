# Welcome to Barkuni's book shop application

# Barkuni Books Shop API

This repository contains a Python Flask application for managing a book shop via RESTful API calls. The application is designed to run on an Amazon EKS cluster.

## Overview

The Barkuni Books Shop API allows you to perform CRUD operations on books. Here are the available endpoints:

- **GET /api/books**: Retrieve a list of all books.
- **POST /api/books**: Add a new book. Requires JSON payload with `title` and `author` fields.
- **DELETE /api/books/{book_id}**: Delete a book by specifying its ID.

## Running on Amazon EKS

The application is deployed and managed on an Amazon EKS cluster for scalability and reliability.

### Prerequisites

- An AWS account with the necessary permissions to create and manage EKS clusters.
- kubectl installed locally to interact with the EKS cluster.

### Deploying the Application

1. Clone this repository to your local machine:

   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. Ensure you have configured AWS credentials and have set the correct region in your AWS CLI or credentials file.

3. Apply the Kubernetes manifests to deploy the application on EKS:

   ```bash
   kubectl apply -f kubernetes-manifests/
   ```

   Replace `kubernetes-manifests/` with the path to the Kubernetes YAML files.

4. Access the application using the LoadBalancer URL or NodePort exposed by the EKS service.

## Local Development

For local development, you can run the application on your machine using Flask's development server.

### Getting Started Locally

1. Install Python 3.x and Flask dependencies:

   ```bash
   pip install flask
   ```

2. Run the Flask application locally:

   ```bash
   python app.py
   ```

   The application will start running on `http://localhost:5000`.

## Usage

### View Books

To view all books, send a GET request to `/api/books`.

Example:

```bash
curl http://localhost:5000/api/books
```

### Add a New Book

To add a new book, send a POST request to `/api/books` with JSON payload containing `title` and `author`.

Example:

```bash
curl -X POST -H "Content-Type: application/json" -d '{"title": "Book Name", "author": "Author Name"}' http://localhost:5000/api/books
```

### Delete a Book

To delete a book, send a DELETE request to `/api/books/{book_id}`, replacing `{book_id}` with the ID of the book you want to delete.

Example:

```bash
curl -X DELETE http://localhost:5000/api/books/{book_id}
```

Replace `{book_id}` with the actual ID of the book you wish to delete.

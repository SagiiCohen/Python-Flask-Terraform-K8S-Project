"
# Flask Bookstore API

## Description

This Flask application serves as a simple RESTful API for managing a bookstore. It allows users to perform CRD operations (Create, Read, Delete) on a collection of books.

## Prerequisites

Before running the application, ensure you have the following installed:
- Python 3.x
- Docker (if running in a containerized environment)

1. (If not using Docker) Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

## Usage

### Running Locally

1. Start the Flask application:
   ```bash
   python app.py
   ```

2. Use a tool like `curl` or Postman to interact with the API endpoints:

   - **GET All Books**:
     ```bash
     curl /api/books
     ```

   - **GET Specific Book**:
     Replace `<book_id>` with the ID of the book:
     ```bash
     curl /api/books/<book_id>
     ```

   - **POST New Book**:
     ```bash
     curl -X POST -H "Content-Type: application/json" -d '{"title":"New Book", "author":"New Author"}' /api/books
     ```

   - **DELETE Book**:
     Replace `<book_id>` with the ID of the book to delete:
     ```bash
     curl -X DELETE /api/books/<book_id>" 
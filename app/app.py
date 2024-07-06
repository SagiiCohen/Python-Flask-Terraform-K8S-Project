from flask import Flask, jsonify, request # type: ignore

app = Flask(__name__)

# Sample data (pretend this is your database or data source)
books = [
    {"id": 1, "title": "Harry Potter and the Philosopher's Stone", "author": "J.K. Rowling"},
    {"id": 2, "title": "Harry Potter and the Chamber of Secrets", "author": "J.K. Rowling"},
    {"id": 3, "title": "The Lord of the Rings", "author": "J. R. R. Tolkien"}
]

# Route to fetch all books (GET request)
@app.route('/api/books', methods=['GET'])
def get_books():
    return jsonify(books)

# Route to fetch a specific book by ID (GET request)
@app.route('/api/books/<int:book_id>', methods=['GET'])
def get_book(book_id):
    book = next((book for book in books if book['id'] == book_id), None)
    if book:
        return jsonify(book)
    return jsonify({"error": "Book not found"}), 404

# Route to create a new book (POST request)
@app.route('/api/books', methods=['POST'])
def create_book():
    new_book = {
        'id': len(books) + 1,
        'title': request.json.get('title'),
        'author': request.json.get('author')
    }
    books.append(new_book)
    return jsonify(new_book), 201

# Route to delete a book by ID (DELETE request)
@app.route('/api/books/<int:book_id>', methods=['DELETE'])
def delete_book(book_id):
    global books
    initial_length = len(books)
    books = [book for book in books if book['id'] != book_id]
    if len(books) < initial_length:
        return jsonify({"message": f"Book ID {book_id} deleted"}), 200
    else:
        return jsonify({"error": "Book not found"}), 404

# Run the app
if __name__ == '__main__':
    app.run(debug=True)
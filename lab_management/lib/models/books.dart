class Book {
  int? id;
  final String title;
  String? author;
  String? publisher;
  int? publicationYear;
  int? quantity;
  String? description;
// Danh sách người mượn

  Book({
    this.id,
    required this.title,
    this.author,
    this.publisher,
    this.publicationYear,
    this.quantity,
    this.description,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      publisher: json['publisher'],
      publicationYear: json['publicationYear'],
      quantity: json['quantity'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'publisher': publisher,
      'publicationYear': publicationYear,
      'quantity': quantity,
      'description': description,
    };
  }

  Map<String, dynamic> toJsonWithoutId() {
    return {
      'title': this.title,
      'author': this.author,
      'publisher': this.publisher,
      'publicationYear': this.publicationYear,
      'quantity': this.quantity,
      'description': this.description,
    };
  }
}

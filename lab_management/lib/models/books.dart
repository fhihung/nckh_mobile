// // ignore_for_file: public_member_api_docs, sort_constructors_first
// class Book {
//   final int id;
//   final String title;
//   final String author;
//   final int quantity;
//   final int borrowerId;
//   final int borrowerQuantity;

//   Book({
//     required this.id,
//     required this.title,
//     required this.quantity,
//     required this.author,
//     required this.borrowerId,
//     required this.borrowerQuantity,
//   });

//   factory Book.fromMap(Map bookMap) {
//     return Book(
//         id: bookMap['id'],
//         title: bookMap['title'],
//         author: bookMap['author'],
//         quantity: bookMap['quantity'],
//         borrowerId: bookMap['borrowerId'],
//         borrowerQuantity: bookMap['borrowerQuantity']);
//   }
//   // void toggle() {
//   //   done = !done;
//   // }
// }
class Book {
  int? id;
  final String title;
  String? author;
  String? publisher;
  int? publicationYear;
  int? quantity;
  String? description;

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
}

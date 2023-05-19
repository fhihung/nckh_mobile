// import 'package:flutter/cupertino.dart';
// import '../services/database_services.dart';
// import 'books.dart';

// class BooksData extends ChangeNotifier {
//   List<Book> books = [];
//   void addBook(String bookTitle) async {
//     Book book = await DatabaseService.addBook(bookTitle);
//     books.add(book);
//     notifyListeners();
//   }

//   // void updateBook(Book book) {
//   //   book.toggle();
//   //   DatabaseService.updateTask(task.id);
//   //   notifyListeners();
//   // }

//   void deleteBook(Book book) {
//     books.remove(book);
//     DatabaseService.deleteTask(book.id);
//     notifyListeners();
//   }
// }

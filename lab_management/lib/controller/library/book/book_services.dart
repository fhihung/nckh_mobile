import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../models/books.dart';


class BookService {
  static const String baseUrl = 'http://localhost:9000/books';

  static Future<List<Book>> fetchAll() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      final books = data.map((item) => Book.fromJson(item)).toList();
      return books;
    } else {
      throw Exception('Failed to fetch books');
    }
  }
 
static Future<Book> fetchBookById(int id) async {
  final url = '$baseUrl/$id'; // Thay baseUrl bằng URL của API getBookById của bạn
 
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final book = Book.fromJson(jsonData);
      return book;
    } else {
      throw Exception('Failed to fetch book');
    }
  } 

  

  static Future<int> fetchTotalBookCount() async {
    final response = await http.get(Uri.parse('$baseUrl/count'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final int count = data;
      return count;
    } else {
      throw Exception('Failed to fetch book count');
    }
  }

  static Future<List<Book>> searchByTitle(String title) async {
    final response = await http.get(Uri.parse('$baseUrl/search/title/$title'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      final books = data.map((item) => Book.fromJson(item)).toList();
      return books;
    } else {
      throw Exception('Failed to search books by title');
    }
  }


  static Future<List<Book>> searchByAuthor(String author) async {
    final response =
        await http.get(Uri.parse('$baseUrl/search/author/$author'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      final books = data.map((item) => Book.fromJson(item)).toList();
      return books;
    } else {
      throw Exception('Failed to search books by author');
    }
  }

  static Future<List<Book>> searchByPublisher(String publisher) async {
    final response =
        await http.get(Uri.parse('$baseUrl/search/publisher/$publisher'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      final books = data.map((item) => Book.fromJson(item)).toList();
      return books;
    } else {
      throw Exception('Failed to search books by publisher');
    }
  }

  static Future<void> add(Book book) async {
    final response = await http.post(
      Uri.parse('$baseUrl/add'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(book.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add book');
    }
  }

  static Future<void> delete(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete book');
    }
  }

  static Future<Book> updateBook(Book book) async {
    final response = await http.put(
      Uri.parse('$baseUrl/update/${book.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(book.toJsonWithoutId()),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Book.fromJson(data);
    } else {
      throw Exception('Failed to update book');
    }
  }
}

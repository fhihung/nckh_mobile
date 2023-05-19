import 'dart:convert';
import '../../models/books.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

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

  static Future<void> add(Book book) async {
    final response = await http.post(
      Uri.parse('$baseUrl/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(book),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add book');
    }
  }

  static Future<void> updateQuantity(
    int id,
    int newQuantity,
  ) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id/quantity/$newQuantity'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // body: jsonEncode(<String, dynamic>{
      //   // 'quantity': newQuantity,
      // }
      // ),
    );
    if (response.statusCode != 204) {
      throw Exception('Failed to update quantity');
    } else if (response.statusCode == 200) {
      throw Exception('Ok');
    }
  }

  static Future<void> delete(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete book');
    }
  }

  static Future<void> update(
    int id,
    int newQuantity,
  ) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id/quantity/$newQuantity'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }
}

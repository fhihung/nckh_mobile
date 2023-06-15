import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class BorrowerService {
  static const String baseUrl = 'http://localhost:9000/borrowers';

  static Future<int> fetchTotalBorrowerCount() async {
    final response = await http.get(Uri.parse('$baseUrl/count'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final int count = data;
      return count;
    } else {
      throw Exception('Failed to fetch borrower count');
    }
  }
}

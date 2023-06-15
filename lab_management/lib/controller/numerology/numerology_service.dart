import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../models/numerology.dart';
import '../../models/users.dart';
import '../../screens/login/component/body.dart';

class NumerologyService {
  Users? user = LoginBodyState.user;
  DateTime now = DateTime.now();
  final String apiUrl = 'http://127.0.0.1:5500/example';
  // final String apiUrl = 'https://72be-1-55-241-30.ngrok-free.app/example';

  // Future<Map<String, dynamic>> getData() async {
  //   final response = await http.get(Uri.parse('http://127.0.0.1:5500/example'));
  //   if (response.statusCode == 200) {
  //     final jsonData = jsonDecode(response.body);
  //     return jsonData;
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  Future<Numerology> postData() async {
    final Map<String, String> data = {
      "name": user!.name!,
      "day": user!.day!,
      "month": user!.month!,
      "year": user!.year!,
      "current_day": DateFormat.d().format(now),
      "current_month": DateFormat.M().format(now),
      "current_year": DateFormat.y().format(now)
    };

    final response = await http.post(Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return Numerology.fromJson(jsonData);
      // print('Data posted successfully');
    } else {
      throw Exception('Failed to load data');
    }
  }
}

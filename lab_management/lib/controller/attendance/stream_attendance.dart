import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../../constant.dart';

import '../../../models/attendance_user.dart';
import 'stream_attendance.dart';

Stream<List<Attendance>> fetchAttendance() async* {
  while (true) {
    final response =
        await http.get(Uri.parse('https://testapi.io/api/21010598/mobile'));
    // await http.get(Uri.parse('http://10.20.34.13:8001/timekeeping'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['data'];

      yield data.map((json) => Attendance.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load attendance');
    }

    // Chờ 30 giây để fetch dữ liệu tiếp theo
    await Future.delayed(Duration(minutes: 100));
  }
}

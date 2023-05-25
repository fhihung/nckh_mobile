// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Attendance {
  final String id;
  final String name;
  final String role;
  final String email;
  final DateTime timestamp;
  DateTime? startTime;
  DateTime? endTime;
  Duration? workDuration;
  final String checknull;

  Attendance({
    required this.id,
    required this.name,
    required this.role,
    required this.email,
    required this.timestamp,
    this.startTime,
    this.endTime,
    this.workDuration,
    this.checknull = "No data",
  });

  factory Attendance.fromJson(List<dynamic> json) {
    return Attendance(
      id: json[0],
      name: json[1],
      role: json[2],
      email: json[3],
      timestamp: DateFormat('EEE, dd MMM yyyy h:mm:ss zzz').parse(json[4]),
    );
  }

  void calculateWorkDuration(List<Attendance> attendanceList) {
    startTime = attendanceList
        .where((a) => a.id == id && a.timestamp.day == timestamp.day)
        .map((a) => a.timestamp)
        .reduce((a, b) => a.isBefore(b) ? a : b);
    endTime = attendanceList
        .where((a) => a.id == id && a.timestamp.day == timestamp.day)
        .map((a) => a.timestamp)
        .reduce((a, b) => a.isAfter(b) ? a : b);

    if (startTime != null && endTime != null) {
      workDuration = startTime!.difference(endTime!);
    }
  }
}

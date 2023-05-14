import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:lab_management/screens/homepage/component/body.dart';
import 'package:lab_management/widgets/date_picker.dart';
import '../../../constant.dart';

import '../../../controller/attendance/stream_attendance.dart';
import '../../../models/attendance_user.dart';

class Bodys extends StatefulWidget {
  @override
  BodysState createState() => BodysState();
}

class BodysState extends State<Bodys> {
  DateTime? _selectedDate = BodyState.choosenDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Attendance>>(
        stream: fetchAttendance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Attendance>? attendanceList = snapshot.data;

            // Chỉ lấy phần tử cuối cùng của mỗi id trong ngày được chọn
            Map<String, Attendance> lastAttendanceMap = {};
            for (Attendance attendance in attendanceList!) {
              if (_selectedDate == null ||
                  DateFormat('dd/MM/yyyy').format(attendance.timestamp) ==
                      DateFormat('dd/MM/yyyy').format(_selectedDate!)) {
                lastAttendanceMap[attendance.id] = attendance;
              }
            }
            List<Attendance> lastAttendanceList =
                lastAttendanceMap.values.toList();

            return Column(
              children: [
                SizedBox(height: 20),
                TextButton(
                  child: Text(
                    _selectedDate == null
                        ? 'Select Date'
                        : DateFormat('dd/MM/yyyy').format(_selectedDate!),
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  onPressed: () async {
                    final DateTime? picked = await pickDate(context);
                    if (picked != null) {
                      setState(() {
                        _selectedDate = picked;
                      });

                      // Tìm kiếm danh sách chấm công cho ngày được chọn
                      List<Attendance> attendanceList = snapshot.data!;
                      List<Attendance> dailyAttendanceList = attendanceList
                          .where((a) =>
                              DateFormat('dd/MM/yyyy').format(a.timestamp) ==
                              DateFormat('dd/MM/yyyy').format(_selectedDate!))
                          .toList();

                      // Hiển thị AlertDialog nếu không có dữ liệu
                      if (dailyAttendanceList.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('No attendance data'),
                            content: Text(
                                'There is no attendance data for the selected date.'),
                            actions: [
                              TextButton(
                                child: Text('OK'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        );
                      }
                    }
                  },
                ),
                ListViewAttendance(
                    lastAttendanceList: lastAttendanceList,
                    attendanceList: attendanceList,
                    selectedDate: _selectedDate),
              ],
            );
          } else if (snapshot.hasError) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${snapshot.error}',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            );
          }

          return Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
            ),
          );
        },
      ),
    );
  }

  Future<DateTime?> pickDate(BuildContext context) async {
    DateTime? initialDate = _selectedDate ?? DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2030),
    );
    return picked;
  }
}

class ListViewAttendance extends StatelessWidget {
  const ListViewAttendance({
    super.key,
    required this.lastAttendanceList,
    required this.attendanceList,
    required DateTime? selectedDate,
  }) : _selectedDate = selectedDate;

  final List<Attendance> lastAttendanceList;
  final List<Attendance>? attendanceList;
  final DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: lastAttendanceList.length,
        itemBuilder: (context, index) {
          Attendance attendance = lastAttendanceList[index];

          // Tính thời gian làm việc trong ngày được chọn
          List<Attendance> dailyAttendanceList = attendanceList!
              .where((a) =>
                  a.id == attendance.id &&
                  DateFormat('dd/MM/yyyy').format(a.timestamp) ==
                      DateFormat('dd/MM/yyyy').format(_selectedDate!))
              .toList();
          DateTime startTime = dailyAttendanceList.first.timestamp;
          DateTime endTime = dailyAttendanceList.last.timestamp;
          Duration workDuration = endTime.difference(startTime);

          // Hiển thị chấm công và thời gian làm việc tương ứng
          return Card(
            elevation: 1,
            child: ListTile(
              title: Text(
                attendance.name,
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              subtitle: Text(
                'Checked in at ${DateFormat('h:mm a').format(attendance.timestamp)}',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              trailing: Text(
                '${workDuration.inHours}h ${workDuration.inMinutes.remainder(60)}m',
                style: TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.w400),
              ),
            ),
          );
        },
      ),
    );
  }
}

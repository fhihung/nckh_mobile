// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// Future<void> _saveData(
//       String name, String day, String month, String year) async {
//     final data = {
//       'name': name,
//       'day': day,
//       'month': month,
//       'year': year,
//     };
//     await FirebaseFirestore.instance.collection('Number').doc().set(data);
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text('Saved')));
//   }
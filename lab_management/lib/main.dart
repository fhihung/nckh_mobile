import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lab_management/screens/attendance/attendance_screen.dart';
import 'package:lab_management/screens/homepage/homepage.dart';

import 'package:lab_management/screens/login/login_screen.dart';
import 'package:lab_management/screens/numerology/numerology_screen.dart';
import 'package:lab_management/theme/themes.dart';
import './constant.dart';
import 'screens/sign_up/textform.dart';
import 'screens/welcome/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab Manager',
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      home: LoginScreen(),
    );
  }
}

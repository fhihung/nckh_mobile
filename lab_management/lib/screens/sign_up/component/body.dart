import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lab_management/constant.dart';

import '../../../widgets/date_picker.dart';
import '../../../widgets/date_picker_field.dart';
import '../../../widgets/format_dialog.dart';
import '../../attendance/attendance_screen.dart';
import '../../homepage/homepage.dart';
import '../../login/component/account_check.dart';
import '../../login/component/forgot_button.dart';
import '../../login/component/or_divider.dart';
import '../../login/component/round_outline_button.dart';
import '../../login/component/rounded_input_field.dart';
import '../../login/component/rounded_password_field.dart';
import '../../login/login_screen.dart';
import '../../../widgets/rounded_button.dart';
import '../sign_up_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isLoading = false;
  String email = '';
  String pass = '';
  String name = '';
  DateTime? doB;
  DateTime? _selectedDate;
  final _fullNameController = TextEditingController();
  final TextEditingController _doBController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.06, bottom: size.height * 0.04),
              child: Text(
                'CREATE YOUR ACCOUNT',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            RoundedInputField(
              hintText: ' Full Name',
              controller: _fullNameController,
              onChanged: (value) {
                name = value;
              },
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            DatePickerField(
                hintText: 'Date of birth',
                controller: _doBController,
                onTap: () async {
                  final DateTime? picked = await pickDate(context);
                  if (picked != null) {
                    setState(() {
                      _selectedDate = picked;
                      _doBController.text =
                          '${picked.day}/${picked.month}/${picked.year}';
                    });
                    // onChanged: (value) {
                    //   doB = value;
                    // },
                  }
                }),
            SizedBox(
              height: size.height * 0.02,
            ),
            // RoundedInputField(
            //   hintText: 'Email Address',
            //   controller: _emailController,
            //   onChanged: (value) {
            //     email = value;
            //   },
            // ),
            // SizedBox(
            //   height: size.height * 0.02,
            // ),
            // RoundedPasswordField(
            //   controller: _passwordController,
            //   textField: 'Password',
            //   onChanged: (value) {
            //     pass = value;
            //   },
            // ),
            // SizedBox(
            //   height: size.height * 0.02,
            // ),
            // RoundedPasswordField(
            //   controller: _passwordConfirmController,
            //   textField: 'Confirm Password',
            //   onChanged: (value) {},
            // ),
            SizedBox(
              height: size.height * 0.03,
            ),
            _isLoading
                ? CircularProgressIndicator(
                    backgroundColor: kPrimaryColor,
                  )
                : RoundedButton(
                    press: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      if (_passwordController.text !=
                          _passwordConfirmController.text) {
                        FormatDialog(
                          text: 'Resigter Failed',
                          styleText: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          styleSubText: TextStyle(fontSize: 16.0),
                          subtext:
                              'Password does not match, Please check again',
                        );
                      }
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .createUserWithEmailAndPassword(
                          email: email,
                          password: pass,
                        );
                        final user = userCredential.user;
                        // Lấy dữ liệu tương ứng với email đăng nhập
                        // await getData(email);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return HomePageScreen();
                        //     },
                        //   ),
                        // );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('Password week');
                        } else if (e.code == "email-already-in-use") {
                          print('Account exists');
                        }
                      }
                      setState(() {
                        _isLoading = false;
                      });
                      _saveData(
                        email,
                        name,
                        _selectedDate!.day.toString(),
                        _selectedDate!.month.toString(),
                        _selectedDate!.year.toString(),
                      );
                      ;
                    },
                    text: 'SIGN UP',
                  ),
            AccountCheck(
              text: 'Already have an account?',
              textBtn: ' Log in',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            SizedBox(
              height: size.height * 0.05,
            ),
            // RoundedOutlineButton(
            //   textBtn: 'Sign in with Google',
            //   press: () {},
            //   icon: 'assets/icons/google.png',
            //   margin: size.width * 0.15,
            // ),
            // RoundedOutlineButton(
            //   textBtn: 'Sign in with Apple',
            //   press: () {},
            //   icon: 'assets/icons/apple-logo.png',
            //   margin: size.width * 0.15,
            // ),
            // RoundedOutlineButton(
            //   textBtn: 'Sign in with Facebook',
            //   press: () {},
            //   icon: 'assets/icons/facebook.png',
            //   margin: size.width * 0.15,
            // ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveData(
    String email,
    String name,
    String day,
    String month,
    String year,
  ) async {
    final data = {
      'email': email,
      'name': name,
      'day': day,
      'month': month,
      'year': year,
    };
    await FirebaseFirestore.instance.collection('Number').doc().set(data);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Saved')));
  }

  Future<DateTime?> pickDate(BuildContext context) async {
    DateTime? initialDate = _selectedDate ?? DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1800),
      lastDate: DateTime(2030),
    );
    return picked;
  }

  // Future<void> getData(String email) async {
  //   final userCollection = FirebaseFirestore.instance.collection('users');
  //   final querySnapshot =
  //       await userCollection.where('email', isEqualTo: email).get();

  //   if (querySnapshot.docs.isNotEmpty) {
  //     final userData = querySnapshot.docs.first.data();
  //     // Hiển thị dữ liệu lên màn hình
  //     print('User data: $userData');
  //   } else {
  //     // Không tìm thấy dữ liệu
  //     print('No data found for email: $email');
  //   }
  // }
}

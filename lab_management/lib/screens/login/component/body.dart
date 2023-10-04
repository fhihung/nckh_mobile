import 'package:flutter/material.dart';
import 'package:lab_management/controller/numerology/numerology_service.dart';
import 'package:lab_management/screens/homepage/homepage.dart';
import 'package:lab_management/screens/login/component/rounded_input_field.dart';
import 'package:lab_management/widgets/rounded_button.dart';

import '../../../models/numerology.dart';

class User {
  final String name;
  final String day;
  final String month;
  final String year;

  User({
    required this.name,
    required this.day,
    required this.month,
    required this.year,
  });
}

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => LoginBodyState();
}

class LoginBodyState extends State<LoginBody> {
  static User? user; // Biến để lưu trữ thông tin người dùng
  static Numerology? data;
  final _nameController = TextEditingController();
  final _dayController = TextEditingController();
  final _monthController = TextEditingController();
  final _yearController = TextEditingController();

  bool _isLoading = false;

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
                'LOG IN',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            RoundedInputField(
              controller: _nameController,
              hintText: 'Full Name',
              labelText: 'Full Name',
              onChanged: (value) {
                // Không cần gán name ở đây
              },
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.only(top: 2, right: 20, left: 20),
              child: Row(
                children: [
                  Expanded(
                    child: RoundedInputField(
                      controller: _dayController,
                      hintText: 'Day',
                      labelText: 'Day',
                      onChanged: (value) {
                        // Không cần gán day ở đây
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: RoundedInputField(
                      controller: _monthController,
                      hintText: 'Month',
                      labelText: 'Month',
                      onChanged: (value) {
                        // Không cần gán month ở đây
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: RoundedInputField(
                      controller: _yearController,
                      hintText: 'Year',
                      labelText: 'Year',
                      onChanged: (value) {
                        // Không cần gán year ở đây
                      },
                    ),
                  ),
                ],
              ),
            ),
            _isLoading
                ? CircularProgressIndicator()
                : RoundedButton(
                    press: () async {
                      setState(() {
                        _isLoading = true;
                      });

                      // Lấy dữ liệu từ các trường nhập liệu
                      String name = _nameController.text;
                      String day = _dayController.text;
                      String month = _monthController.text;
                      String year = _yearController.text;

                      // Tạo đối tượng User
                      user = User(
                        name: name,
                        day: day,
                        month: month,
                        year: year,
                      );

                      // Gọi hàm xử lý đăng nhập
                      await _handleLogin();
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HomePageScreen();
                          },
                        ),
                      );
                      setState(() {
                        _isLoading = false;
                      });
                    },
                    text: 'LOG IN',
                  ),

            // Rest của mã
          ],
        ),
      ),
    );
  }

  // Hàm xử lý đăng nhập
  Future<void> _handleLogin() async {
    data = await NumerologyService().postData();
    // Sử dụng biến user để truyền dữ liệu người dùng

    // Ví dụ: In thông tin người dùng ra console
    if (user != null) {
      print('Logged in as ${user!.name}');
      print('Date of Birth: ${user!.day}/${user!.month}/${user!.year}');
    }
  }
}

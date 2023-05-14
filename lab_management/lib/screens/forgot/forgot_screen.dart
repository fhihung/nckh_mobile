import 'package:flutter/material.dart';
import '../login/login_screen.dart';
import 'component/body.dart';
import 'component/back_appbar.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(
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
      body: Body(),
    );
  }
}

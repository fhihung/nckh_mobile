// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../login/login_screen.dart';
import '/constant.dart';
import '../../sign_up/sign_up_screen.dart';
import 'rounded_button.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to AIoT Lab',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          Image.asset(
            "assets/images/ai.png",
            height: size.height * 0.4,
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          RoundedButton(
            text: "LOG IN",
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
          RoundedButton(
            text: "SIGN UP",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
            btnColor: kSecondaryColor,
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../login/component/rounded_input_field.dart';
import '../../welcome/component/rounded_button.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  'Forgot Your Password?',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Text(
                'No worries, you just need to type your email address or username and we will send the verification code.'),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          RoundedInputField(
            hintText: 'Email Address',
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          RoundedButton(
            press: () {},
            text: 'RESET MY PASSWORD',
          )
        ],
      ),
    );
  }
}

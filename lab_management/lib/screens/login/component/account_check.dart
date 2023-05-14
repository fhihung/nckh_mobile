import 'package:flutter/material.dart';

class AccountCheck extends StatelessWidget {
  final bool? login;
  final VoidCallback? press;
  final String? textBtn;
  final String? text;

  const AccountCheck({
    Key? key,
    this.login,
    this.press,
    this.textBtn,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text!,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          GestureDetector(
              onTap: press,
              child:
                  Text(textBtn!, style: Theme.of(context).textTheme.headline2))
        ],
      ),
    );
  }
}

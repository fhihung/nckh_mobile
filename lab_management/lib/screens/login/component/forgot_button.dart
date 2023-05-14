import 'package:flutter/material.dart';

class ForgotButton extends StatelessWidget {
  final String? textBtn;
  final VoidCallback? press;
  const ForgotButton({
    Key? key,
    this.textBtn,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(
              left: size.width * 0.04,
              bottom: size.width * 0.05,
              top: size.width * 0.02),
          child: TextButton(
              onPressed: press,
              child: Text(
                textBtn!,
                style: Theme.of(context).textTheme.headline2,
              )),
        ),
      ],
    );
  }
}

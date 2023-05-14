// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RoundedOutlineButton extends StatelessWidget {
  final String? textBtn;
  final VoidCallback? press;
  final String? icon;
  final double? margin;

  const RoundedOutlineButton({
    Key? key,
    this.textBtn,
    this.press,
    this.icon,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      width: size.width * 0.88,
      height: size.height * 0.1,
      child: OutlinedButton(
        onPressed: press,
        child: Row(
          children: [
            Container(
              width: size.width * 0.06,
              child: Image.asset(
                icon!,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: margin!),
              child: Text(
                textBtn!,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

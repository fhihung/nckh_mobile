import 'package:flutter/material.dart';
import '/constant.dart';

class RoundedButton extends StatelessWidget {
  final String? text;
  final VoidCallback press;
  final Color? btnColor, textColor;

  const RoundedButton({
    Key? key,
    this.text,
    required this.press,
    this.textColor,
    this.btnColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isLoading = false;
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      height: size.height * 0.08,
      width: size.width * 0.88,
      child: ElevatedButton(
        onPressed: press,
        child: Text(
          text!,
          style: TextStyle(color: textColor, fontWeight: FontWeight.normal),
        ),
        style: ElevatedButton.styleFrom(
          primary: btnColor,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

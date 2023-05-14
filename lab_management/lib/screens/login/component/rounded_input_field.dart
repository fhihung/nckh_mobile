import 'package:flutter/material.dart';
import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText, labelText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  const RoundedInputField(
      {Key? key,
      this.hintText,
      this.labelText,
      this.onChanged,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextFieldContainer(
        child: TextField(
      controller: controller,
      onChanged: onChanged,
      // textAlign: TextAlign.left,
      autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.labelMedium,
        border: InputBorder.none,
        // filled: true,
        // contentPadding: EdgeInsets.only(bottom: size.height * 0.016),
      ),
    ));
  }
}

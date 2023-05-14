// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:lab_management/constant.dart';

class FormattedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? press;
  final String textTitle;
  final String textButton;
  final Icon icon;
  Function? tap;

  FormattedAppBar({
    Key? key,
    this.press,
    required this.textTitle,
    required this.textButton,
    required this.icon,
    this.tap,
  }) : super(key: key);
  Size get preferredSize => Size.fromHeight(60.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        textTitle,
        style: Theme.of(context).textTheme.headline5,
      ),
      leading: Builder(
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Icon(
              Icons.menu_outlined,
              color: kPrimaryColor, // Change Custom Drawer Icon Color
            ),

            // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      actions: [
        GestureDetector(
            onTap: () {},
            child: Padding(padding: EdgeInsets.only(right: 10), child: icon)),
      ],
    );
  }
}

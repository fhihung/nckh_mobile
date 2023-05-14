import 'package:flutter/material.dart';
import 'package:lab_management/constant.dart';

import '../../homepage/homepage.dart';
import '../../login/login_screen.dart';

class AttendanceAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AttendanceAppBar({
    super.key,
  });
  Size get preferredSize => Size.fromHeight(60.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        'Home',
        style: Theme.of(context).textTheme.headline5,
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return HomePageScreen();
              },
            ),
          );
        },
        icon: Icon(Icons.arrow_back),
        color: Colors.black,
      ),
      actions: [
        TextButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Text(
                'Settings',
                style: TextStyle(color: kPrimaryColor),
              ),
            )),
      ],
      elevation: 0,
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:lab_management/constant.dart';

class HomeAppBar extends StatelessWidget {
  final VoidCallback? press;
  final String? textTitle;
  final Icon icon;
  HomeAppBar({
    Key? key,
    this.press,
    this.textTitle,
    required this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
          left: size.height * 0.02,
          right: size.height * 0.02,
          top: size.width * 0.11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Icon(
                      Icons.menu_outlined,
                      color: kSecondaryColor, // Change Custom Drawer Icon Color
                    ),
                    // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              Text(
                textTitle!,
                style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          GestureDetector(
              onTap: () {},
              child: FittedBox(
                child: Container(
                    decoration: BoxDecoration(
                        color: k3, borderRadius: BorderRadius.circular(8)),
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(8),
                    child: icon),
              )),
        ],
      ),
    );
  }
}

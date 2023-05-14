import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../constant.dart';
import '../../homepage/component/home_appbar.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: kSecondaryColor,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: size.height * 0.02,
                right: size.height * 0.02,
                top: size.width * 0.11),
          ),
          Row(),
        ],
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:lab_management/screens/login/component/body.dart';

import '../../../constant.dart';
import '../../../controller/numerology/if_else.dart';
import '../../homepage/component/home_appbar.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        color: kSecondaryColor,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: size.height * 0.02,
                  right: size.height * 0.02,
                  top: size.width * 0.11),
            ),
            ExpansionMainNumeber(
              number: '${LoginBodyState.data!.duongDoi}',
              title: 'Con số đường đời',
              subtitle: DDNumber(),
            ),
            ExpansionMainNumeber(
              number: '${LoginBodyState.data!.vanMenh}',
              title: 'Con số vận mệnh',
              subtitle: VMNumber(),
            ),
            ExpansionMainNumeber(
              number: '${LoginBodyState.data!.linhHon}',
              title: 'Con số linh hồn',
              subtitle: LHNumber(),
            ),
            ExpansionMainNumeber(
              number: '${LoginBodyState.data!.tinhCach}',
              title: 'Con số tính cách',
              subtitle: TCNumber(),
            ),
            ExpansionMainNumeber(
              number: '${LoginBodyState.data!.ngaySinh}',
              title: 'Con số ngày sinh',
              subtitle: NSNumber(),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpansionMainNumeber extends StatelessWidget {
  String title;
  String subtitle;
  String number;
  ExpansionMainNumeber({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Card(
        child: ExpansionTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: Text(number),
          children: <Widget>[
            ListTile(title: Text(subtitle)),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lab_management/constant.dart';
import 'package:lab_management/controller/numerology/if_else.dart';
import 'package:lab_management/screens/attendance/attendance_screen.dart';
import 'package:lab_management/screens/homepage/component/home_appbar.dart';
import 'package:lab_management/screens/library/library_screen.dart';
import 'package:lab_management/screens/login/component/body.dart';
import 'package:lab_management/widgets/format_dialog.dart';
import 'package:page_transition/page_transition.dart';
import '../../../widgets/button_menu.dart';
import '../../library/overview_screen.dart';
import '../../numerology/numerology_screen.dart';
import 'ngay_ca_nhan.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => BodyState();
}

class BodyState extends State<Body> {
  static DateTime? choosenDate;
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    String formattedDate = DateFormat('EEEE, d, MMMM, yyyy').format(today);
    var size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          HomeAppBar(
            icon: Icon(
              Icons.notifications,
              color: kSecondaryColor,
            ),
            // textTitle: 'Hi, Hung!',
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Text(
            '${formattedDate}',
            style: TextStyle(
                color: kSecondaryColor,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Container(
            padding: EdgeInsets.only(bottom: size.height * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: NgayCaNhan(
                    detailText: NCNNumber(),
                    text: 'Ngày cá nhân',
                    numberText: LoginBodyState.data!.ngayCaNhan,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: NgayCaNhan(
                    detailText: TCNNumber(),
                    text: 'Tháng cá nhân',
                    numberText: LoginBodyState.data!.thangCaNhan,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: NgayCaNhan(
                    detailText: NamCNNumber(),
                    text: 'Năm cá nhân',
                    numberText: LoginBodyState.data!.namCaNhan,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0)),
                color: Color.fromARGB(255, 235, 235, 235),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              right: 20, left: 30, bottom: 10, top: 10),
                          child: Text(
                            'Menu',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        margin: EdgeInsets.only(
                            left: size.width * 0.08,
                            right: size.width * 0.08,
                            bottom: size.height * 0.023),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Icon(Icons.calendar_month),
                            ),
                            Expanded(flex: 1, child: SizedBox(width: 18)),
                            Expanded(
                              flex: 8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Check-in Information',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      BodyState.choosenDate != null
                                          ? 'Selected Date: ${DateFormat('dd/MM/yyyy').format(BodyState.choosenDate!)}'
                                          : 'Please Choose Date',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    onTap: () async {
                                      final DateTime? picked =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2100),
                                      );
                                      if (picked != null &&
                                          picked != BodyState.choosenDate) {
                                        setState(() {
                                          BodyState.choosenDate = picked;
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: SizedBox(
                                  width: 2,
                                )),
                            GestureDetector(
                              onTap: () {
                                BodyState.choosenDate != null
                                    ? Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: AttendanceScreen(),
                                        ),
                                      )
                                    : showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return FormatDialog(
                                            styleText: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                            styleSubText: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                            text: "Warning!",
                                            subtext: "Please pick the date!",
                                          );
                                        },
                                      );
                              },
                              child: Container(
                                child: Icon(
                                  Icons.arrow_circle_right_sharp,
                                  color: kPrimaryColor,
                                  size: 35,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ButtonMenu(
                      taptap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: NumerologyScreen(),
                          ),
                        );
                      },
                      icon: Icon(Icons.timeline),
                      // width: 88,
                      titleText: 'Numerology',
                      subTitle: 'Tâm linh',
                    ),
                    ButtonMenu(
                      taptap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: DashBoardScreen(),
                          ),
                        );
                      },
                      // width: 154,
                      icon: Icon(Icons.menu_book),
                      titleText: 'Library',
                      subTitle: 'Tri thức',
                    ),
                    ButtonMenu(
                      taptap: () {},
                      // width: 144,
                      icon: Icon(Icons.bookmark_add),
                      titleText: 'Project',
                      subTitle: 'Coming soon',
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

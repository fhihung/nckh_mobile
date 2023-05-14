import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lab_management/controller/numerology/numerology_service.dart';

import 'package:page_transition/page_transition.dart';
import '../../constant.dart';
import '../../models/numerology.dart';
import '../../models/users.dart';
import '../login/component/body.dart';
import '../welcome/welcome_screen.dart';
import 'component/body.dart';
import 'component/home_appbar.dart';

class HomePageScreen extends StatelessWidget {
  static Numerology? number;

  Users? user = LoginBodyState.user;
  HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      drawer: Drawer(
        child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 18),
                  child: Card(
                    child: ListTile(
                      leading: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: kPrimaryColor,
                        ),
                      ),
                      title: Text(
                        '${user!.name}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Text(
                        '${user!.day}/${user!.month}/${user!.year}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: ElevatedButton(
                    child: Text('Exit'),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: WelcomeScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ]),
        ),
      ),
      body: Body(),
    );
  }
}

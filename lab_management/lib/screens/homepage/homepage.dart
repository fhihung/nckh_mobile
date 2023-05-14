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
          child: Column(children: [
            ListTile(
              title: Text('${user!.name}'),
              subtitle: Text('${user!.day}/${user!.month}/${user!.year}'),
            ),
            Container(
              child: OutlinedButton(
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

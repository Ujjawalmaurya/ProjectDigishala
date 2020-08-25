import 'package:digishala/homepage.dart';
import 'package:digishala/student/stuLoginPage.dart';
import 'package:digishala/student/stuZone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//code used from https://medium.com/coding-with-flutter/super-simple-authentication-flow-with-flutter-firebase-737bba04924c
class LandingPage extends StatelessWidget {
  static const String id = 'LandingPage';
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          FirebaseUser user = snapshot.data;
          if (user == null) {
            return HomePage();
          }

          return StudentZone();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

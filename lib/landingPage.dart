import 'package:digishala/loginPage.dart';
import 'package:digishala/student/stuZone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//code used from https://medium.com/coding-with-flutter/super-simple-authentication-flow-with-flutter-firebase-737bba04924c
class LandingPage extends StatelessWidget {
  static const String id = 'LandingPage';
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          if (user == null) {
            return StudentLoginScreen();
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

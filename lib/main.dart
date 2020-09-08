import 'package:digishala/aboutUs/aboutUs.dart';
import 'package:digishala/aboutUs/admission.dart';
import 'package:digishala/aboutUs/policy.dart';
import 'package:digishala/aboutUs/terms.dart';
import 'package:digishala/homepage.dart';
import 'package:digishala/messaging/broadCast.dart';
import 'package:digishala/messaging/chats.dart';
import 'package:digishala/loginPage.dart';
import 'package:digishala/student/stuZone.dart';
import 'package:digishala/student/videoPlayer.dart';
import 'package:flutter/material.dart';
import 'package:digishala/landingPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //
      //
      //
      initialRoute: LandingPage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        StudentLoginScreen.id: (context) => StudentLoginScreen(),
        StudentZone.id: (context) => StudentZone(),
        Videos.id: (context) => Videos(),
        LandingPage.id: (context) => LandingPage(),
        ChatScreen.id: (context) => ChatScreen(),
        BroadCast.id: (context) => BroadCast(),

        ///
        AboutUs.id: (context) => AboutUs(),
        AdmissionProcedure.id: (context) => AdmissionProcedure(),
        Policy.id: (context) => Policy(),
        TermsnC.id: (context) => TermsnC(),
      },
      //
      //
      //
      debugShowCheckedModeBanner: false,
      title: 'Navodaya Children\'s Academy',
      theme: ThemeData.light(),
      // home: HomePage(),
    );
  }
}

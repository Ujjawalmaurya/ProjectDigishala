import 'package:digishala/aboutUs/aboutUs.dart';
import 'package:digishala/aboutUs/admission.dart';
import 'package:digishala/homepage.dart';
import 'package:digishala/student/broadCast.dart';
import 'package:digishala/student/chats.dart';
import 'package:digishala/student/stuLoginPage.dart';
import 'package:digishala/student/stuZone.dart';
import 'package:digishala/student/videos.dart';
import 'package:flutter/material.dart';
import 'package:digishala/student/landingPage.dart';

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
        AboutUs.id: (context) => AboutUs(),
        AdmissionProcedure.id: (context) => AdmissionProcedure(),
        StudentZone.id: (context) => StudentZone(),
        Videos.id: (context) => Videos(),
        LandingPage.id: (context) => LandingPage(),
        ChatScreen.id: (context) => ChatScreen(),
        BroadCast.id: (context) => BroadCast(),
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

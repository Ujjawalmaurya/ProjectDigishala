import 'package:digishala/aboutUs/aboutUs.dart';
import 'package:digishala/aboutUs/admission.dart';
import 'package:digishala/homepage.dart';
import 'package:digishala/student/stuLoginPage.dart';
import 'package:digishala/student/stuZone.dart';
import 'package:digishala/student/videos.dart';
import 'package:digishala/teacher/teacherLoginPage.dart';
import 'package:digishala/teacher/teachersZone.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //
      //
      //
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        StudentLoginScreen.id: (context) => StudentLoginScreen(),
        AboutUs.id: (context) => AboutUs(),
        AdmissionProcedure.id: (context) => AdmissionProcedure(),
        TeacherAuthentication.id: (context) => TeacherAuthentication(),
        TeacherZone.id: (context) => TeacherZone(),
        StudentZone.id: (context) => StudentZone(),
        Videos.id: (context) => Videos(),
      },
      //
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

import 'package:digishala/aboutUs/aboutUs.dart';
import 'package:digishala/aboutUs/admission.dart';
import 'package:digishala/aboutUs/policy.dart';
import 'package:digishala/aboutUs/terms.dart';
import 'package:digishala/messaging/broadCast.dart';
import 'package:digishala/messaging/chats.dart';
import 'package:digishala/loginPage.dart';
import 'package:digishala/student/stuZone.dart';
import 'package:digishala/student/videoPlayer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:digishala/landingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return CircularProgressIndicator();
    }

    return MaterialApp(
      //
      //
      //
      initialRoute: LandingPage.id,
      routes: {
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
    ;
  }
}

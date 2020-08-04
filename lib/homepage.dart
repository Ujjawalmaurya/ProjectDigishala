import 'package:digishala/aboutUs/aboutUs.dart';
import 'package:digishala/student/stuLoginPage.dart';
import 'package:digishala/student/stuZone.dart';
import 'package:digishala/teacher/teacherLoginPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'constants.dart';

class HomePage extends StatefulWidget {
  static const String id = 'HomePage';
  final String username, pass;

  HomePage({
    Key key,
    @required this.username,
    @required this.pass,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  alreadyloginOrNot(context) async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final FirebaseUser user = await _firebaseAuth.currentUser();

    if (user != null) {
      print("not working");
      Navigator.pushReplacementNamed(
        context,
        StudentZone.id,
      );
    } else {
      print("Not Logged before");
      Navigator.pushReplacementNamed(
        context,
        StudentLoginScreen.id,
      );
    }
  }

  loggerChecker(context) async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final FirebaseUser user = await _firebaseAuth.currentUser();

    if (user != null) {
      print("not working");
      Navigator.pushReplacementNamed(
        context,
        StudentZone.id,
      );
    } else {
      print("Not Logged before");
    }
  }

  @override
  void initState() {
    super.initState();

    loggerChecker(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kContainerThemeDecoration,
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 25.0),
            Container(
              child: Hero(
                tag: 'logo',
                child: CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    backgroundImage: kLogoAsset,
                    radius: 120.0),
              ),
            ),
            SizedBox(
              height: 120.0,
            ),
            Container(
              // margin: EdgeInsets.all(10.0),
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            padding: EdgeInsets.all(5.0),
                            elevation: 25.0,
                            onPressed: () {
                              alreadyloginOrNot(context);
                            },
                            onLongPress: () {
                              Navigator.pushNamed(
                                  context, TeacherAuthentication.id);
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 22.0,
                                fontFamily: 'Pacifico',
                              ),
                            ),
                            color: Color(0xFFFF0084),
                            splashColor: Colors.deepPurpleAccent,
                            textTheme: ButtonTextTheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    //Another buttom
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            padding: EdgeInsets.all(5.0),
                            elevation: 25.0,
                            onPressed: () {
                              Navigator.pushNamed(context, AboutUs.id);
                            },
                            child: Text(
                              "Know More? About us",
                              style: TextStyle(
                                  fontSize: 22.0, fontFamily: 'Pacifico'),
                            ),
                            color: Color(0xFF010A43),
                            splashColor: Color(0xFFFF2E63),
                            textTheme: ButtonTextTheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

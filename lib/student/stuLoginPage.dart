import 'package:digishala/constants.dart';
import 'package:digishala/student/stuZone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../homepage.dart';

class StudentLoginScreen extends StatefulWidget {
  static const String id = 'stuLoginPage';

  @override
  _StudentLoginScreenState createState() => _StudentLoginScreenState();
}

class _StudentLoginScreenState extends State<StudentLoginScreen> {
  GlobalKey<FormState> _key = new GlobalKey();

  bool _autovalidate = false;
  bool isLoading = false;
  final _auth = FirebaseAuth.instance;
  String email, pass;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/login2.png",
          ),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      width: double.infinity,
      height: double.infinity,
      // padding: EdgeInsets.all(20.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 25.0,
                  ),
                  Hero(
                    tag: 'logo',
                    child: CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                      radius: 90.0,
                      backgroundImage: kLogoAsset,
                    ),
                  ),
                  SizedBox(
                    height: 85.0,
                  ),
                  SingleChildScrollView(
                    child: Form(
                      key: _key,
                      child: Card(
                        margin: EdgeInsets.all(15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(0.0),
                            ),
                            ListTile(
                              leading: FaIcon(FontAwesomeIcons.userAlt),
                              title: TextFormField(
                                validator: (input) {
                                  if (input.isEmpty) {
                                    return 'Username is required';
                                  }
                                },
                                decoration:
                                    InputDecoration(labelText: "Username"),
                                onSaved: (input) {
                                  setState(() {
                                    email = input;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              leading: FaIcon(FontAwesomeIcons.lock),
                              title: TextFormField(
                                obscureText: true,
                                validator: (input) {
                                  if (input.isEmpty) {
                                    return 'Password is required';
                                  } else if (input.length < 6) {
                                    return 'Password is too short';
                                  }
                                },
                                decoration:
                                    InputDecoration(labelText: "Password"),
                                onSaved: (input) {
                                  setState(() {
                                    email = input;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                            ),
                            Container(
                              height: 50.0,
                              width: 220.0,
                              child: RaisedButton(
                                onPressed: () async {
                                  // print(email);
                                  // print(pass);
                                  // try {
                                  //   final user =
                                  //       await _auth.signInWithEmailAndPassword(
                                  //           email: email, password: pass);
                                  //   if (user != null) {
                                  // Navigator.pushNamed(context, StudentZone.id);
                                  //   }
                                  // } catch (e) {
                                  //   print(e);
                                  // }
                                },
                                color: Colors.redAccent,
                                splashColor: Colors.deepPurpleAccent,
                                child: Text(
                                  "Get in",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontFamily: 'Pacifico',
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(15.0))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


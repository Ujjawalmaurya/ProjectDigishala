import 'package:digishala/teacher/teachersZone.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TeacherAuthentication extends StatefulWidget {
  static const String id = 'teacherAuth';

  @override
  _TeacherAuthenticationState createState() => _TeacherAuthenticationState();
}

class _TeacherAuthenticationState extends State<TeacherAuthentication> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autovalidate = false;
  String tUsername, tPass;
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
                backgroundImage: AssetImage("assets/mascot.png"),
              ),
            ),
            SizedBox(
              height: 65.0,
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
                              return 'Teacher\s User Name is required';
                            }
                          },
                          decoration: InputDecoration(
                              labelText: "Teacher\'s User Name"),
                          onSaved: (input) => tUsername = input,
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
                          decoration: InputDecoration(labelText: "Password"),
                          onSaved: (input) => tPass = input,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      ButtonTheme(
                        height: 50.0,
                        minWidth: 220.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, TeacherZone.id);
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
    );
  }
}

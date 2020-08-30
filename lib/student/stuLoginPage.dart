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
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  bool _autovalidate = false;
  bool isLoading = false;

  String email, pass;
  String errorMsg;

  //SignIn with email Fxn
  signIn() async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: this.email, password: this.pass);
      final FirebaseUser user = result.user;
      print(user);
      if (user != null) {
        //Navigation
        Navigator.pushReplacementNamed(context, StudentZone.id);
      }
    } catch (e) {
      setState(() {
        errorMsg = e.message;
      });
      errorDialog();
    }
  }

  errorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          title: Text(
            'Error',
            style: TextStyle(color: Colors.red),
          ),
          content: Text(errorMsg),
          actions: [
            FlatButton(
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(color: Colors.red, width: 2),
              ),
              onPressed: () {
                clearFields();
                Navigator.of(context).pop();
              },
              child: Text("Ok"),
            )
          ],
        );
      },
    );
  }

  clearFields() {}

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
        child: Center(
          child: Form(
            key: _key,
            child: Card(
              elevation: 20.0,
              margin: EdgeInsets.only(
                  // top: 70.0, bottom: 70.0,
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(5.0)),
                      Hero(
                        tag: 'asset',
                        child: Container(
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                    image: AssetImage('assets/asset3.jpg'))),
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.width * 0.70),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005),
                      //==========
                      //Username
                      ////========
                      ListTile(
                        leading: FaIcon(FontAwesomeIcons.userAlt),
                        title: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Username is required';
                            }
                          },
                          decoration: InputDecoration(labelText: "Username"),
                          onSaved: (input) {
                            setState(() {
                              email = input;
                            });
                            print(this.email);
                          },
                        ),
                      ),
                      ////==============
                      ///Password
                      ////==============
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
                                  pass = input;
                                });
                                print(this.pass);
                              })),
                      Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.02)),
                      Container(
                          height: 50.0,
                          width: MediaQuery.of(context).size.width * 0.65,
                          /////////////////////////////////////////////////////
                          ///===================Get-IN Button=======///////////
                          /////////////////////////////////////////////////////
                          child: RaisedButton(
                              onPressed: () {
                                if (_key.currentState.validate()) {
                                  _key.currentState.save();
                                  signIn();
                                }
                              },
                              color: Colors.redAccent,
                              splashColor: Colors.deepPurpleAccent,
                              child: Text("Get in",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontFamily: 'Pacifico')),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0)))),
                      Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.035)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

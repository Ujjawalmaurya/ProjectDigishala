import 'package:digishala/homepage.dart';
import 'package:digishala/student/broadCast.dart';
import 'package:digishala/student/chats.dart';
import 'package:digishala/student/docsList.dart';
import 'package:digishala/student/videoList.dart';
import 'package:digishala/student/videos.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentZone extends StatefulWidget {
  static const String id = 'stuZone';

  @override
  _StudentZoneState createState() => _StudentZoneState();
}

class _StudentZoneState extends State<StudentZone> {
  String isLoading = "false";
  String studentClass;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  signOut() {
    Navigator.pushReplacementNamed(context, HomePage.id);
    FirebaseAuth.instance.signOut();
  }

  studentClassGetter() async {
    setState(() {
      isLoading = 'true';
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map snapShotdata = Map();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;

    final db =
        FirebaseDatabase.instance.reference().child("studentInfos").child(uid);
    db.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;

      if (values == null) {
        Fluttertoast.showToast(
            msg: 'Login with Correct Account',
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            toastLength: Toast.LENGTH_LONG);
      } else {
        for (var i = 0; i < values.keys.length; i++) {
          setState(() {
            snapShotdata[i] = values.values.toList()[i];
          });
        }
        setState(() {
          studentClass = snapShotdata[1];
        });

        prefs.remove('selectedClass');
        prefs.setString("selectedClass", studentClass);
        setState(() {
          isLoading = 'false';
        });
      }
    });
  }

  void docsOrVideo(sub) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 10.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          title: Text('Select your option',
              style: TextStyle(color: Colors.red, fontSize: 25.0)),
          content: Text(
              'Select "Docs" for provided Documents, "Videos" for Video Lectures.',
              style: TextStyle(fontSize: 17.0)),
          actions: [
            FlatButton(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                    side: BorderSide(color: Colors.red, width: 2)),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DocsList(sub: sub);
                  }));
                },
                child: Text("Docs", style: TextStyle(fontSize: 20.0))),
            FlatButton(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.red, width: 2)),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return VideosList(sub: sub);
                  }));
                },
                child: Text("Videos", style: TextStyle(fontSize: 20.0)))
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    studentClassGetter();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == 'true'
        ? Container(
            color: Color(0xff4834DF),
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            child: Center(child: SpinKitFadingCube(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Colors.red : Colors.yellow,
                  ),
                );
              },
            )),
          )
        : Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                Image(
                  image: AssetImage('assets/mascot.png'),
                ),
              ],
              backgroundColor: kThemeColor, //value is in constants file
              title: Text(
                "Subjects",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              titleSpacing: 2.5,
              centerTitle: true,
            ),
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                      decoration: BoxDecoration(color: kThemeColor),
                      child: Row(
                        children: [
                          CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.15,
                              child: Image(
                                image: AssetImage('assets/mascot.png'),
                              )),
                          SizedBox(width: 8),
                          Column(
                            children: [
                              Text('Navodaya',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.amberAccent)),
                              Text('Children\'s',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.amberAccent)),
                              Text('Academy',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.amberAccent)),
                              Text('DigiShala',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      letterSpacing: 7,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white)),
                            ],
                          ),
                        ],
                      )),
                  ListTile(
                    title: Text("Subjects"),
                    leading: FaIcon(
                      Icons.subject,
                      color: kThemeColor,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text("Refresh class"),
                    leading: FaIcon(
                      Icons.class_,
                      color: kThemeColor,
                    ),
                    onTap: () {
                      studentClassGetter();
                    },
                    subtitle: Text("class ${studentClass}"),
                  ),
                  Divider(color: kThemeColor),
                  ListTile(
                      title: Text("Chats/Discussion"),
                      leading: FaIcon(
                        Icons.chat,
                        color: kThemeColor,
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ChatScreen(studentClass: studentClass);
                          },
                        ));
                      }),
                  ListTile(
                    title: Text("Notice/Announcements"),
                    leading:
                        FaIcon(FontAwesomeIcons.bullhorn, color: kThemeColor),
                    onTap: () {
                      Navigator.pushNamed(context, BroadCast.id);
                    },
                  ),
                  Divider(color: kThemeColor),
                  Divider(color: kThemeColor),
                  ListTile(
                    title: Text("Logout"),
                    leading:
                        FaIcon(FontAwesomeIcons.signOutAlt, color: kThemeColor),
                    onTap: () {
                      signOut();
                    },
                  ),
                ],
              ),
            ),
            body: Container(
              decoration: kContainerThemeDecoration,
              width: double.infinity,
              height: double.infinity,
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //////=====================
                          ///subjects ===============
                          ////=======================
                          SubjectContainer(
                            title: 'English',
                            onPressed: () {
                              docsOrVideo('English');
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SubjectContainer(
                            title: 'Hindi',
                            onPressed: () {
                              docsOrVideo('Hindi');
                            },
                          ),
                          SubjectContainer(
                            title: 'Maths',
                            onPressed: () {
                              docsOrVideo('Maths');
                            },
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.deepOrangeAccent,
                      ),
                      Row(
                        children: <Widget>[
                          SubjectContainer(
                            title: "Physics",
                            onPressed: () {
                              docsOrVideo('Physics');
                            },
                          ),
                        ],
                      ),
                      Row(children: <Widget>[
                        SubjectContainer(
                          title: 'Chemistry',
                          onPressed: () {
                            docsOrVideo('Chemistry');
                          },
                        ),
                        SubjectContainer(
                          title: "Biology",
                          onPressed: () {
                            docsOrVideo('Biology');
                          },
                        )
                      ]),
                      Divider(color: Colors.deepPurpleAccent),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SubjectContainer(
                            title: 'Computer',
                            onPressed: () {
                              docsOrVideo('Computer');
                            },
                          ),
                        ],
                      ),
                      Divider(color: Colors.deepOrangeAccent),
                      Row(
                        children: <Widget>[
                          SubjectContainer(
                            title: "Geography",
                            onPressed: () {
                              docsOrVideo('Geography');
                            },
                          ),
                          SubjectContainer(
                            title: "History",
                            onPressed: () {
                              docsOrVideo('History');
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SubjectContainer(
                            title: "Civics",
                            onPressed: () {
                              docsOrVideo('Civics');
                            },
                          ),
                          SubjectContainer(
                            title: 'Economics',
                            onPressed: () {
                              docsOrVideo('Economics');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}

////================
///custom widget ===
////================
class SubjectContainer extends StatelessWidget {
  SubjectContainer({
    @required this.title,
    @required this.onPressed,
    // this.highlightColour,
  });

  final String title;
  final Function onPressed;
  // final Color highlightColour;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: RaisedButton(
          elevation: 50.0,
          highlightColor: Colors.white10,
          padding: EdgeInsets.fromLTRB(5, 70, 5, 70),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          color: Colors.blue,
        ),
      ),
    );
  }
}

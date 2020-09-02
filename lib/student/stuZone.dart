import 'package:digishala/homepage.dart';
import 'package:digishala/student/broadCast.dart';
import 'package:digishala/student/chats.dart';
import 'package:digishala/student/docsList.dart';
import 'package:digishala/student/videoList.dart';
import 'package:digishala/student/videos.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            msg: 'Login with Correct Accout',
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          title: Text(
            'Alert',
            style: TextStyle(color: Colors.red),
          ),
          content: Text('Select One Option'),
          actions: [
            FlatButton(
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(color: Colors.red, width: 2),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return DocsList(sub: sub);
                  },
                ));
              },
              child: Text("Docs"),
            ),
            FlatButton(
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(color: Colors.red, width: 2),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return VideosList(sub: sub);
                  },
                ));
              },
              child: Text("Videos"),
            )
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
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    backgroundColor: Colors.purple,
                  ),
                  Text(
                    'Fetching Data',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )
                ],
              ),
            ))
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
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: kThemeColor), //#constants
                    accountName: Text("Student\'s.name"),
                    accountEmail: Text("Student\'s.email@nca"),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.purpleAccent,
                    ),
                  ),
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
                    title: Text("Refreshe class"),
                    leading: FaIcon(
                      Icons.class_,
                      color: kThemeColor,
                    ),
                    onTap: () {
                      studentClassGetter();
                    },
                    subtitle: Text("class ${studentClass}"),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Chats/Discussion"),
                    leading: FaIcon(
                      Icons.chat,
                      color: kThemeColor,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, ChatScreen.id);
                    },
                  ),
                  ListTile(
                    title: Text("Notice/Announcements"),
                    leading: FaIcon(
                      Icons.group,
                      color: kThemeColor,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, BroadCast.id);
                    },
                  ),
                  Divider(),
                  Divider(),
                  ListTile(
                    title: Text("Logout"),
                    leading: FaIcon(
                      Icons.call_missed_outgoing,
                      color: kThemeColor,
                    ),
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
                            colour: Colors.lightBlue,
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.deepOrangeAccent,
                      ),
                      Row(
                        children: <Widget>[
                          SubjectContainer(
                            title: "Geography",
                            onPressed: () {
                              docsOrVideo('Geography');
                            },
                            colour: Colors.deepPurpleAccent,
                          ),
                          SubjectContainer(
                            title: "History",
                            onPressed: () {
                              docsOrVideo('History');
                            },
                            colour: Colors.green,
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
                            colour: Colors.amberAccent,
                          ),
                          SubjectContainer(
                            title: 'Economics',
                            onPressed: () {
                              docsOrVideo('Economics');
                            },
                            colour: Colors.indigo,
                          ),
                        ],
                      ),
                      Divider(color: Colors.deepPurpleAccent),
                      Row(
                        children: <Widget>[
                          SubjectContainer(
                            title: "Physics",
                            onPressed: () {
                              docsOrVideo('Physics');
                            },
                            colour: Colors.tealAccent,
                          ),
                          SubjectContainer(
                            title: 'Chemistry',
                            onPressed: () {
                              docsOrVideo('Chemistry');
                            },
                            colour: Colors.cyanAccent,
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SubjectContainer(
                            title: "Biology",
                            onPressed: () {
                              docsOrVideo('Biology');
                            },
                            colour: Colors.greenAccent,
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
    @required this.colour,
    // this.highlightColour,
  });

  final String title;
  final Function onPressed;
  final Color colour;
  // final Color highlightColour;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: RaisedButton(
          highlightColor: Colors.white10,
          padding: EdgeInsets.fromLTRB(5, 75, 5, 75),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          color: colour,
        ),
      ),
    );
  }
}

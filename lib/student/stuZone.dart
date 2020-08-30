import 'package:digishala/homepage.dart';
import 'package:digishala/student/broadCast.dart';
import 'package:digishala/student/chats.dart';
import 'package:digishala/student/docsList.dart';
import 'package:digishala/student/videoList.dart';
import 'package:digishala/student/videos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  int studentClass;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  signOut() {
    Navigator.pushReplacementNamed(context, HomePage.id);
    FirebaseAuth.instance.signOut();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  Future checkIfClassIsSelectedOrNot() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String selectedClass = prefs.getString('selectedClass') ?? '';
    print(selectedClass);
    if (selectedClass == '') {
      _showClassDialog();
    } else {
      print('Class Already Selected');
      final selectedClass = prefs.getString('selectedClass') ?? '';
      print(selectedClass);
    }
  }

  Future setClass() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String selectedClass = prefs.getString('selectedClass') ?? '';
    if (selectedClass == '') {
      prefs.setString("selectedClass", studentClass.toString());
    } else {
      await prefs.remove('selectedClass');
      prefs.setString("selectedClass", studentClass.toString());
    }
  }

  _showClassDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            // backgroundColor: kThemeColor,
            // scrollable: true,
            // elevation: 30.0,
            title: Text(
              'Select your Class First',
              style: TextStyle(color: kThemeColor),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  RaisedButton(
                    textColor: Colors.white,
                    child: Text('Class-6'),
                    onPressed: () {
                      setState(() {
                        studentClass = 6;
                      });

                      Navigator.of(context).pop();
                      setClass();
                    },
                    color: Colors.pinkAccent,
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    child: Text('Class-7'),
                    onPressed: () {
                      setState(() {
                        studentClass = 7;
                      });
                      Navigator.of(context).pop();
                      setClass();
                    },
                    color: Colors.pinkAccent,
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    child: Text('Class-8'),
                    onPressed: () {
                      setState(() {
                        studentClass = 8;
                      });
                      Navigator.of(context).pop();
                      setClass();
                    },
                    color: Colors.pinkAccent,
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    child: Text('Class-9'),
                    onPressed: () {
                      setState(() {
                        studentClass = 9;
                      });
                      Navigator.of(context).pop();
                      setClass();
                    },
                    color: Colors.pinkAccent,
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    child: Text('Class-10'),
                    onPressed: () {
                      setState(() {
                        studentClass = 10;
                      });
                      Navigator.of(context).pop();
                      setClass();
                    },
                    color: Colors.pinkAccent,
                  ),
                ],
              ),
            ),
          );
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
    getCurrentUser();
    checkIfClassIsSelectedOrNot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              title: Text("Watch Video"),
              leading: FaIcon(
                Icons.video_library,
                color: kThemeColor,
              ),
              onTap: () {
                Navigator.pushNamed(context, Videos.id);
              },
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
            ListTile(
              title: Text("Change Class"),
              leading: FaIcon(
                Icons.note,
                color: kThemeColor,
              ),
              onTap: () {
                Navigator.of(context).pop();
                _showClassDialog();
              },
            ),
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

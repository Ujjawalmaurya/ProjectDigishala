import 'package:digishala/homepage.dart';
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
  signOut() {
    Navigator.pushReplacementNamed(context, HomePage.id);
    FirebaseAuth.instance.signOut();
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

  @override
  void initState() {
    super.initState();
    checkIfClassIsSelectedOrNot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          /////===========================
          ///logo with hero animation
          ////============================
          Hero(
            tag: 'logo',
            child: Image(
              image: AssetImage('assets/mascot.png'),
            ),
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
              title: Text("Chats"),
              leading: FaIcon(
                Icons.chat,
                color: kThemeColor,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text("Group Discussion"),
              leading: FaIcon(
                Icons.group,
                color: kThemeColor,
              ),
              onTap: () {},
            ),
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
            ListTile(
              title: Text("Provided Notes"),
              leading: FaIcon(
                Icons.note,
                color: kThemeColor,
              ),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: Text("Logout"),
              leading: FaIcon(
                Icons.call_missed_outgoing,
                color: kThemeColor,
              ),
              onTap: () {
                // signOut();
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
                      onPressed: () {},
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
                      onPressed: () {},
                      colour: Colors.deepPurpleAccent,
                    ),
                    SubjectContainer(
                      title: "History",
                      onPressed: () {},
                      colour: Colors.green,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SubjectContainer(
                      title: "Civics",
                      onPressed: () {},
                      colour: Colors.amberAccent,
                    ),
                    SubjectContainer(
                      title: 'Economics',
                      onPressed: () {},
                      colour: Colors.indigo,
                    ),
                  ],
                ),
                Divider(color: Colors.deepPurpleAccent),
                Row(
                  children: <Widget>[
                    SubjectContainer(
                      title: "Physics",
                      onPressed: () {},
                      colour: Colors.tealAccent,
                    ),
                    SubjectContainer(
                      title: 'Chemistry',
                      onPressed: () {},
                      colour: Colors.cyanAccent,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SubjectContainer(
                      title: "Biology",
                      onPressed: () {},
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

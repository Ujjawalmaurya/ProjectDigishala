import 'package:flutter/material.dart';
import '../constants.dart';

class TeacherZone extends StatefulWidget {
  static const String id = 'teacherZone';
  @override
  _TeacherZoneState createState() => _TeacherZoneState();
}

class _TeacherZoneState extends State<TeacherZone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Hero(
            tag: 'logo',
            child: Image(
              image: AssetImage('assets/mascot.png'),
            ),
          ),
        ],
        backgroundColor: kThemeColor,
        title: Text(
          "GuruZone :)",
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        titleSpacing: 2.5,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: kThemeColor),
              accountName: Text("Teacher.name"),
              accountEmail: Text("Teacher.email@domainName.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.purpleAccent,
              ),
            ),
            ListTile(
              title: Text("Subjects"),
              leading: Icon(Icons.subject),
              onTap: () {},
            ),
            ListTile(
              title: Text("Add Video"),
              leading: Icon(Icons.add),
            ),
            Divider(),
            ListTile(
              title: Text("Dummy Data 0"),
              leading: Icon(Icons.ac_unit),
              onTap: () {},
            ),
            ListTile(
              title: Text("Dummy Data 1"),
              leading: Icon(Icons.access_time),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Container(
        decoration: kContainerThemeDecoration,
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Center(
              child: Text(
            "Body",
            style: TextStyle(
              fontSize: 100.0,
              color: Colors.amberAccent,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ),
    );
  }
}

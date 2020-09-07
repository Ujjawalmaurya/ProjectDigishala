import 'package:digishala/aboutUs/policy.dart';
import 'package:digishala/aboutUs/terms.dart';
import 'package:digishala/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  static const String id = 'AboutUs';
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About US'), backgroundColor: kThemeColor),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(color: kThemeColor),
                child: Row(children: [
                  CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.13,
                      child: Image(
                        image: AssetImage('assets/mascot.png'),
                      )),
                  Column(
                    children: [
                      Text('Navodaya',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 26.0,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w800,
                              color: Colors.amberAccent)),
                      Text('Children\'s',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 26.0,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w800,
                              color: Colors.amberAccent)),
                      Text('Academy',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 26.0,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w800,
                              color: Colors.amberAccent)),
                      Text('DigiShala',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0,
                              letterSpacing: 7,
                              fontWeight: FontWeight.w300,
                              color: Colors.white)),
                    ],
                  )
                ])),
            ListTile(
                title: Text("About us"),
                leading:
                    FaIcon(FontAwesomeIcons.infoCircle, color: kThemeColor),
                onTap: () {
                  Navigator.pop(context);
                }),
            ListTile(
                title: Text("Privacy policy"),
                // leading: FaIcon(FontAwesomeIcons.infoCircle, color: kThemeColor),
                onTap: () {
                  Navigator.pushNamed(context, Policy.id);
                }),
            ListTile(
                title: Text("Terms and Conditions"),
                // leading: FaIcon(FontAwesomeIcons.infoCircle, color: kThemeColor),
                onTap: () {
                  Navigator.pushNamed(context, TermsnC.id);
                }),
          ],
        ),
      ),
      body: Container(
        decoration: kContainerThemeDecoration,
        height: MediaQuery.of(context).size.height / 1,
        width: MediaQuery.of(context).size.width / 1,
        child: Center(
          child: Card(
            elevation: 25.0,
            margin: EdgeInsets.all(5.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Heading'),
                  Text('Paragraph'),
                  Text('Heading'),
                  Text('Paragraph'),
                  Text('Heading'),
                  Text('Paragraph'),
                  Text('Heading'),
                  Text('Paragraph'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

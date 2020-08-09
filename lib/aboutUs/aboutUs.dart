import 'package:digishala/aboutUs/admission.dart';
import 'package:digishala/constants.dart';
import 'package:digishala/homepage.dart';
import 'package:digishala/student/stuLoginPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUs extends StatefulWidget {
  static const String id = 'aboutUs';
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("About Us"),
        leading: Icon(Icons.account_box),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Ujjawal"),
              accountEmail: Text("ujjawalmauryaum@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/mascot.png"),
              ),
            ),
            ListTile(
              title: Text("Admission Procedure"),
              leading: FaIcon(FontAwesomeIcons.plus),
              onTap: () =>
                  Navigator.of(context).pushNamed(AdmissionProcedure.id),
            ),
            Divider(),
            ListTile(
              title: Text("Home"),
              leading: FaIcon(FontAwesomeIcons.home),
              onTap: () => Navigator.of(context)
                  .pushNamedAndRemoveUntil(HomePage.id, (route) => false),
            ),
            ListTile(
              title: Text("Login"),
              leading: FaIcon(FontAwesomeIcons.arrowAltCircleRight),
              onTap: () =>
                  Navigator.of(context).popAndPushNamed(StudentLoginScreen.id),
            ),
            Divider(),
            ListTile(
              title: Text("About us"),
              leading: Icon(Icons.account_balance),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: kContainerThemeDecoration,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}

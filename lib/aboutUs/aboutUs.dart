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
        elevation: 10.0,
        actions: <Widget>[
          Image(
            image: AssetImage('assets/mascot.png'),
          ),
        ],
        backgroundColor: kThemeColor,
        title: Text("About Us"),
      ),
      ////=======
      ///Drawer==
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(color: kThemeColor),
                child: Row(children: [
                  CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.15,
                      child: Image(
                        image: AssetImage('assets/mascot.png'),
                      )),
                  Column(children: [
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
                            color: Colors.white))
                  ])
                ])),
            ListTile(
              title: Text("About us"),
              leading: Icon(Icons.account_balance, color: kThemeColor),
              onTap: () => Navigator.of(context).pop(),
            ),
            Divider(color: kThemeColor),
            ListTile(
              title: Text("Home"),
              leading: FaIcon(FontAwesomeIcons.home, color: kThemeColor),
              onTap: () => Navigator.of(context)
                  .pushNamedAndRemoveUntil(HomePage.id, (route) => false),
            ),
            ListTile(
              title: Text("Login"),
              leading: FaIcon(FontAwesomeIcons.arrowAltCircleRight,
                  color: kThemeColor),
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(StudentLoginScreen.id),
            ),
            Divider(color: kThemeColor),
            ListTile(
              title: Text("Privacy Policy"),
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

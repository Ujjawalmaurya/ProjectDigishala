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
      appBar: AppBar(
        title: Text('About US'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height / 1,
        width: MediaQuery.of(context).size.width / 1,
        child: Center(
          child:
              Text('Not final Build Credits will be shown after final build'),
        ),
      ),
    );
  }
}

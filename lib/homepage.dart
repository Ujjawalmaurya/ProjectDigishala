import 'package:digishala/aboutUs/aboutUs.dart';
import 'package:digishala/loginPage.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  static const String id = 'HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String errorMsg;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: kContainerThemeDecoration,
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: Center(
                child: Form(
                    // key: _key,
                    child: Card(
                        elevation: 15.0,
                        margin: EdgeInsets.only(
                            // top: 50.0, bottom: 50.0,
                            left: MediaQuery.of(context).size.width * 0.05,
                            right: MediaQuery.of(context).size.width * 0.05),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: SingleChildScrollView(
                            child: Column(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/asset2.jpg'))),
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: MediaQuery.of(context).size.width *
                                        0.9)),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.06),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.76,
                                child: RaisedButton(
                                    padding: EdgeInsets.all(6.0),
                                    elevation: 20.0,
                                    onPressed: () {
                                      ///Navigation
                                      Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          StudentLoginScreen.id,
                                          (route) => false);
                                    },
                                    child: Text("Login",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .aspectRatio *
                                                35,
                                            fontFamily: 'Pacifico')),
                                    color: Color(0xFFFF0084),
                                    splashColor: kThemeColor,
                                    textTheme: ButtonTextTheme.primary,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0)))),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.032),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.76,
                              child: RaisedButton(
                                onPressed: () {
                                  //Navigation
                                  Navigator.pushNamed(context, AboutUs.id);
                                },
                                padding: EdgeInsets.all(6.0),
                                elevation: 25.0,
                                child: Text("Know More? About us",
                                    style: TextStyle(
                                        fontSize: MediaQuery.of(context)
                                                .size
                                                .aspectRatio *
                                            35,
                                        fontFamily: 'Pacifico')),
                                color: Color(0xFF010A43),
                                splashColor: Color(0xFFFF2E63),
                                textTheme: ButtonTextTheme.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.055,
                            )
                          ],
                        )))))));
  }
}

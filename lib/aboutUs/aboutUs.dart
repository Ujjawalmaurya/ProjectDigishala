import 'package:digishala/aboutUs/policy.dart';
import 'package:digishala/aboutUs/terms.dart';
import 'package:digishala/constants.dart';
import 'package:digishala/student/stuZone.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:digishala/CustomWidgets/drawerHeader.dart';

class AboutUs extends StatefulWidget {
  static const String id = 'AboutUs';
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('About us'), backgroundColor: kThemeColor),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              NCADrawerHeader(),
              ListTile(
                  title: Text("About us"),
                  // leading:
                  //     FaIcon(FontAwesomeIcons.infoCircle, color: kThemeColor),
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
          child: SingleChildScrollView(
            child: Card(
                color: Colors.white.withOpacity(0.95),
                elevation: 25.0,
                margin: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(children: [
                    Text(
                        "Navodaya Children Academy (NCA), Hathidahan Prayagraj, Utter Pradesh - 211013",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 25),
                    Text(
                        "Dear parents and students, welcome to all of you in the session 2020-2021.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        )),
                    SizedBox(height: 10),
                    Text(
                        "As you all know that Navodaya Children's Academy (NCA) has been fulfilling all your educational needs for many years, we want your children to always be the top in studies, but in this way, the last semester, dangerous life all over the world. The deadly virus has been gradually engulfed all over the world and this deadly virus has disrupted all our activities, causing the biggest obstacle in children's studies. As we all know that today, in the world of technology, there is a whole world, which is being used by every person at every step, new technologies are also being discovered. We are still using techniques in studies in a small amount, but at the moment when the whole world is escaping the crowd, schools are not able to open due to vigilance,we introduced a new kind of Virtual Classes to solve this. Has been done, which are being presented to you. These classes will be available on a portal called NCA, which will be exactly like a school classroom. These classes will be carefully watched and heard, repeated and prepared notes. We will make sure that your assessments and examinations will be done keeping in mind the Social Distancing, so that your studies will continue to be studies and promotions will continue in the classroom. But yes, when we get rid of Covid 19, our DigiShala will continue to work so that if a child misses a class, then there will be nothing to worry, you will be able to see that class again. You will be able to solve your problem through phone also, our aim is to provide you complete education through DigiShala because our team has the support of specific people, who are working hard day and night to prepare it.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        )),
                    SizedBox(height: 10),
                    Text(
                        "We resolve to make society a new direction by making our students a decent and capable person. We are confident that you will benefit from the educational system set by the NCA. You will become a successful citizen.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.width * 0.04)),
                    Text(
                      "Kind regards :                                                              ",
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 20),
                    Row(children: [
                      SizedBox(width: MediaQuery.of(context).size.width * 0.3),
                      Column(
                        children: [
                          Text("Director",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.04)),
                          SizedBox(height: 6),
                          Text("Ram Ashare Maurya",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.04)),
                          SizedBox(height: 6),
                          Text("Navodaya Children's Academy",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.04)),
                          Text("Hathigahan, Prayagraj",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.04)),
                          Text("Uttar Pradesh, 211013",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.04)),
                          SizedBox(height: 15),
                        ],
                      )
                    ])
                  ]),
                )),
          ),
        ));
  }
}

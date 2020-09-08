import 'package:digishala/constants.dart';
import 'package:digishala/student/videos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_database/firebase_database.dart';

class VideosList extends StatefulWidget {
  final String sub;
  VideosList({Key key, @required this.sub}) : super(key: key);

  @override
  _VideosListState createState() => _VideosListState();
}

class _VideosListState extends State<VideosList> {
  Map datakey = new Map();
  Map snapShotdata = new Map();
  String isloading = 'false';
  String selectedSubject;
  String selectedClass;

  @override
  void initState() {
    super.initState();

    getSubjectAndClass();
  }

  getSubjectAndClass() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String sClass = prefs.getString('selectedClass') ?? '';
    if (sClass != null) {
      print(selectedClass);
      print(widget.sub);
      setState(() {
        isloading = 'true';
        selectedClass = sClass;
        selectedSubject = widget.sub;
      });
      getData();
    } else {
      Fluttertoast.showToast(
          msg: 'First select class',
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          toastLength: Toast.LENGTH_SHORT);
    }
  }

  getData() async {
    print('i am');
    setState(() {
      snapShotdata.clear();
      datakey.clear();
    });
    final db = FirebaseDatabase.instance
        .reference()
        .child(selectedClass)
        .child(selectedSubject);
    db.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;

      if (values == null) {
        print('if');
        setState(() {
          isloading = 'false';
        });
        Fluttertoast.showToast(
            msg: 'No videos uploaded in this section',
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            toastLength: Toast.LENGTH_LONG);
      } else {
        print('isnsise func');
        for (var i = 0; i < values.keys.length; i++) {
          setState(() {
            datakey[i] = values.keys.toList()[i].toString();
            snapShotdata[i] = values.values.toList()[i];
          });
        }
        setState(() {
          isloading = 'false';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.sub} Videos list'),
        backgroundColor: kThemeColor,
      ),
      body: isloading == 'true'
          ? Container(
              color: Color(0xff4834DF),
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              child: Center(child: SpinKitDoubleBounce(
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(30.0),
                      color: index.isEven ? Colors.red : Colors.yellow,
                    ),
                  );
                },
              )),
            )
          : Container(
              height: MediaQuery.of(context).size.height / 1,
              width: MediaQuery.of(context).size.width / 1,
              child: ListView.builder(
                itemCount: datakey.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: FaIcon(
                          FontAwesomeIcons.video,
                          color: kThemeColor,
                        ),
                        title: Text(snapShotdata[index]['title'],
                            style: TextStyle(fontSize: 17.0)),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return Videos(link: snapShotdata[index]['link']);
                            },
                          ));
                        },
                      ),
                      Divider(color: kThemeColor)
                    ],
                  );
                },
              ),
            ),
    );
  }
}

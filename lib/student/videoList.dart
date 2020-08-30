import 'package:digishala/homepage.dart';
import 'package:digishala/main.dart';
import 'package:digishala/student/videos.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
        title: Text('Videos list'),
      ),
      body: isloading == 'true'
          ? Container(
              height: MediaQuery.of(context).size.height / 1,
              width: MediaQuery.of(context).size.width / 1,
              color: Colors.grey,
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.purple,
                ),
              ),
            )
          : Container(
              height: MediaQuery.of(context).size.height / 1,
              width: MediaQuery.of(context).size.width / 1,
              child: ListView.builder(
                itemCount: datakey.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.video_call),
                    title: Text(snapShotdata[index]['title']),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Videos(link: snapShotdata[index]['link']);
                        },
                      ));
                    },
                  );
                },
              ),
            ),
    );
  }
}

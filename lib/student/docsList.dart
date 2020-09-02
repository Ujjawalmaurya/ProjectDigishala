import 'package:digishala/main.dart';
import 'package:digishala/student/videos.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:url_launcher/url_launcher.dart';

class DocsList extends StatefulWidget {
  final String sub;
  DocsList({Key key, @required this.sub}) : super(key: key);
  @override
  _DocsListState createState() => _DocsListState();
}

class _DocsListState extends State<DocsList> {
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
        .child('docs')
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
            msg: 'No videos Docs in this section',
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
          print(snapShotdata.toString());
        }
        setState(() {
          isloading = 'false';
        });
      }
    });
  }

  launchUrl(url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      Fluttertoast.showToast(
          msg: 'Oops', textColor: Colors.white, backgroundColor: Colors.green);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Docs list'),
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
                    leading: FaIcon(FontAwesomeIcons.file),
                    title: Text(snapShotdata[index]['title']),
                    subtitle: Text(snapShotdata[index]['filename']),
                    onTap: () {
                      launchUrl(snapShotdata[index]['url']);
                    },
                  );
                },
              ),
            ),
    );
  }
}

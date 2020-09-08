import 'package:digishala/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  final String studentClass;
  ChatScreen({Key key, @required this.studentClass}) : super(key: key);
  static const String id = 'chat';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final clearMessage = TextEditingController();
  final _firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  String messageText;
  String currentClass;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: null,
          title: Text('Discussion'),
          backgroundColor: kThemeColor,
        ),
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
              StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection(widget.studentClass)
                    .orderBy('time', descending: false)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.8,
                            width: MediaQuery.of(context).size.width * 1,
                            child: Center(child: SpinKitCubeGrid(
                                itemBuilder: (BuildContext context, int index) {
                              return DecoratedBox(
                                  decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadiusDirectional.circular(30.0),
                                color: index.isEven ? Colors.red : kThemeColor,
                              ));
                            }))));
                  }
                  final messages = snapshot.data.documents.reversed;
                  List<Bubble> messageWidgets = [];
                  for (var message in messages) {
                    final messageText = message.data['text'];
                    final messageSender = message.data['sender'];
                    final timeOfMsg = message.data['timeOfMsg'];
                    final dateOfMsg = message.data['dateOfMsg'];
                    final currentUser = loggedInUser.email;
                    final messageWidget = Bubble(
                      sender: messageSender,
                      text: messageText,
                      dateOfMsg: dateOfMsg,
                      timeOfMsg: timeOfMsg,
                      itsMeOrNot: currentUser == messageSender,
                    );
                    messageWidgets.add(messageWidget);
                  }
                  return Expanded(
                      child: ListView(
                          reverse: true,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 8.0),
                          children: messageWidgets));
                },
              ),
              Container(
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: Colors.lightBlueAccent, width: 2.0)),
                  ),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: clearMessage,
                            onChanged: (value) {
                              messageText = value;
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 15.0),
                              hintText: 'Put your querries here...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        FlatButton(
                            onPressed: () {
                              //send functionality
                              if (messageText != null &&
                                  messageText.trim().length != 0) {
                                if (widget.studentClass != 'expelled') {
                                  final DateTime now = DateTime.now();
                                  clearMessage.clear(); // Clears the message
                                  _firestore
                                      .collection(widget.studentClass)
                                      .add({
                                    'text': messageText,
                                    'sender': loggedInUser.email,
                                    'time':
                                        Timestamp.now().millisecondsSinceEpoch,
                                    'timeOfMsg': DateFormat.jms().format(now),
                                    'dateOfMsg':
                                        DateFormat.yMMMMd().format(now),
                                  });
                                } else {
                                  Fluttertoast.showToast(
                                      msg:
                                          'You are Explled And not eligible to send message',
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      toastLength: Toast.LENGTH_LONG);
                                }
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'Enter text',
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    toastLength: Toast.LENGTH_SHORT);
                                clearMessage.clear();
                              }
                            },
                            child: Text(
                              'Send',
                              style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ))
                      ]))
            ])));
  }
}

class Bubble extends StatelessWidget {
  Bubble(
      {this.sender,
      this.text,
      this.itsMeOrNot,
      this.dateOfMsg,
      this.timeOfMsg});

  final String sender;
  final String text;
  final bool itsMeOrNot;
  final String dateOfMsg;
  final String timeOfMsg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.0),
      child: Column(
        crossAxisAlignment:
            itsMeOrNot ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(sender, style: TextStyle(fontSize: 12.0)),
          Material(
              borderRadius: itsMeOrNot
                  ? BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0))
                  : BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0)),
              elevation: 25.0,
              color: itsMeOrNot ? Colors.lightBlue : Colors.white60,
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Text('${text}',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: itsMeOrNot ? Colors.white : Colors.black)))),
          Text(timeOfMsg.toString(), style: TextStyle(fontSize: 10.0)),
          Text(dateOfMsg.toString(), style: TextStyle(fontSize: 8.0)),
        ],
      ),
    );
  }
}

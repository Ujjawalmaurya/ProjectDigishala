import 'package:flutter/material.dart';

class SubjectContainer extends StatelessWidget {
  SubjectContainer({
    @required this.title,
    @required this.onPressed,
    // this.highlightColour,
    @required this.color,
  });

  final String title;
  final Function onPressed;
  final Color color;
  // final Color highlightColour;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(6.0),
        child: RaisedButton(
          elevation: 30.0,
          highlightColor: Colors.white10,
          padding: EdgeInsets.fromLTRB(
              5,
              MediaQuery.of(context).size.width * 0.175,
              5,
              MediaQuery.of(context).size.width * 0.175),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.075,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
          color: color,
        ),
      ),
    );
  }
}

import 'package:digishala/constants.dart';
import 'package:flutter/material.dart';

class AdmissionProcedure extends StatefulWidget {
  static const String id = 'admission';

  @override
  _AdmissionProcedureState createState() => _AdmissionProcedureState();
}

class _AdmissionProcedureState extends State<AdmissionProcedure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Admission Procedure"),
        centerTitle: true,
      ),
      body: Container(
        decoration: kContainerThemeDecoration,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}

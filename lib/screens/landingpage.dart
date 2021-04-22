import 'package:firebase_auth/firebase_auth.dart';
import 'landingpagedoctor.dart';
import 'package:flutter/material.dart';
import 'package:doctor/database.dart';
import 'landingpagepatient.dart';
import 'package:fluttertoast/fluttertoast.dart';

class landingpage extends StatefulWidget {
  @override
  _landingpageState createState() => _landingpageState();
}

class _landingpageState extends State<landingpage> {
  final _uid = FirebaseAuth.instance.currentUser.uid;
  @override


  Widget build(BuildContext context) async {


    if (await DatabaseService(uid: _uid).checkIfDoctor() == true) {
      Fluttertoast.showToast(msg: 'Taking you to Doctor\'s dashboard');
      print(_uid);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => (landingpagedoctor())),
      );

    }
    if (await DatabaseService(uid: _uid).checkIfDoctor() == true) {
      Fluttertoast.showToast(msg: 'Taking you to Patient\'s dashboard');
      print(_uid);
      return landingpagepatient();
    }
  }



}
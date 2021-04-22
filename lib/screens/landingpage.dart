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

  Widget landingpagewidget() {
    return FutureBuilder(builder: (context, landingpagewidget) {
      if (DatabaseService(uid: _uid).checkIfDoctor() == true) {
        Fluttertoast.showToast(msg: 'Taking you to Doctor\'s dashboard');
        print(_uid);
        return landingpagedoctor();
      }
      if (DatabaseService(uid: _uid).checkIfPatient() == true) {
        Fluttertoast.showToast(msg: 'Taking you to Patient\'s dashboard');
        print(_uid);
        return landingpagepatient();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return landingpagewidget();
  }
}

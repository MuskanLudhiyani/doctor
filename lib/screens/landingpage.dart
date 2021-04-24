import 'package:firebase_auth/firebase_auth.dart';
import 'package:doctor/screens/landingpagepatient.dart';
import 'package:flutter/material.dart';
import 'package:doctor/database.dart';
import 'package:doctor/screens/landingpagedoctor.dart';
import 'package:fluttertoast/fluttertoast.dart';

class landingpage extends StatefulWidget {
  @override
  _landingpageState createState() => _landingpageState();
}

class _landingpageState extends State<landingpage> {
  final _uid = FirebaseAuth.instance.currentUser.uid;

  Widget landingpagewidget() {
    return FutureBuilder(
        future: DatabaseService(uid: _uid).checkIfDoctor(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print(snapshot.data);
            if (snapshot.data) {
              Fluttertoast.showToast(msg: 'Taking you to Doctor\'s dashboard');
              return landingpagedoctor();
            } else {
              Fluttertoast.showToast(msg: 'Taking you to Patient\'s dashboard');
              print(_uid);
              return landingpagepatient();
            }
          } else {
            return Container(child: Center(child: CircularProgressIndicator()));
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return landingpagewidget();
  }
}

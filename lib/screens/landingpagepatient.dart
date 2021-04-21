import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class landingpagepatient extends StatefulWidget {
  @override
  _landingpagepatientState createState() => _landingpagepatientState();
}

class _landingpagepatientState extends State<landingpagepatient> {
  final uid = FirebaseAuth.instance.currentUser.uid;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

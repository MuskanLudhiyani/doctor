import 'package:flutter/material.dart';
import 'package:doctor/database.dart';
import 'package:doctor/authentication.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class appointments extends StatefulWidget {
  @override
  _appointmentsState createState() => _appointmentsState();
}

class _appointmentsState extends State<appointments> {
  @override
  Widget build(BuildContext context) {
    final appoints = Provider.of<QuerySnapshot>(context);
    print(appoints.docs);
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().appoints,
      initialData: null,
      child: Container(),
    );
  }
}

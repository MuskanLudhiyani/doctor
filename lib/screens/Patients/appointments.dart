import 'package:flutter/material.dart';
import 'package:doctor/database.dart';
import 'package:doctor/authentication.dart';
import 'package:provider/provider.dart';
import 'package:doctor/models/appointment.dart';

class appointments extends StatefulWidget {
  @override
  _appointmentsState createState() => _appointmentsState();
}

class _appointmentsState extends State<appointments> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<appointment>>.value(
      value: DatabaseService().appoints,
      initialData: null,
      builder: (context, appointments) {
        return appointlist(context);
      },
    );
  }

  Widget appointlist(BuildContext context) {
    final appoints = Provider.of<List<appointment>>(context);
    appoints.forEach((appointment) {
      print(appointment.date);
      print(appointment.doctor);
      print(appointment.patient);
      print(appointment.time);
    });
    return Container();
  }
}

import 'package:firebase_auth/firebase_auth.dart';
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
      initialData: [],
      builder: (context, appointments) {
        return appointlist(context);
      },
    );
  }

  Widget appointlist(BuildContext context) {
    final String _uid = FirebaseAuth.instance.currentUser.uid;
    final appoints = Provider.of<List<appointment>>(context);
    if (appoints.isEmpty || appoints == null) {
      return CircularProgressIndicator();
    }
    return Scaffold(
      backgroundColor: Color(0xffEFF0F5),
      body: ListView.builder(
          itemCount: appoints.length,
          itemBuilder: (context, index) {
            if (appoints[index].patient == _uid) {
              return Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Container(
                    color: Colors.blue[50],
                    child: Column(
                      children: [
                        Text(appoints[index].dname),
                        Text(appoints[index].time),
                        Text(appoints[index].date),
                      ],
                    ),
                  ));
            } else {
              return SizedBox(
                height: 0,
              );
            }
          }),
    );
  }
}

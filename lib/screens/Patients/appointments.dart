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
              return Column(
                children: [
                  GestureDetector(
                    onTap:  () {

                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Container(
                        height: 80,
                        width: 500,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffF0EFFE),
                              blurRadius: 2.0,
                              spreadRadius: 0.0,
                              offset: Offset(
                                  2.0, 2.0), // shadow direction: bottom right
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(appoints[index].dname,
                                style: TextStyle(
                                    fontSize: 20,
                                    color:Color(0xff4C3C88),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat')),
                            Text(appoints[index].time,
                              style: TextStyle(
                                  fontSize: 15,
                                  color:Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),),
                            Text(appoints[index].date,
                                style: TextStyle(
                                    fontSize: 15,
                                    color:Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat')),


                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,)
                ],

              );
            } else {
              return SizedBox(
                height: 0,
              );
            }
          }),
    );
  }
}

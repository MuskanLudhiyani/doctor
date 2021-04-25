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
    return Scaffold(
      backgroundColor: Color(0xffEFF0F5),

      body :ListView.builder(
        itemCount: appoints.length,
          itemBuilder: (context,index){
          return Padding(
            padding: EdgeInsets.only(top: 8),
            child: Card(
              margin: EdgeInsets.fromLTRB(20,6,20,0),
              child: ListTile(
                tileColor: Colors.white,
                leading: Text("Dr.  ${appoints[index].doctor}",
                  style: TextStyle(
                  fontSize: 20,fontWeight: FontWeight.bold,
                  fontFamily: "calibre",
                  color: Color(0xff4C3C88),
                ),),
                title: Text("Date : ${appoints[index].date}",
                  style: TextStyle(
                  fontSize: 20,fontWeight: FontWeight.bold,
                  fontFamily: "calibre",
                  color: Colors.red,
                ),),
                subtitle:Text("Time : ${appoints[index].time}",
                    style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold,
                      fontFamily: "calibre",
                      color: Colors.black,
                    ),
                  
                ),

              ),

            ),

          );

          }
      ),
    );
  }
}

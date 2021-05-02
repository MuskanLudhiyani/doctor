import 'package:doctor/screens/Patients/presp2.dart';
import 'package:doctor/screens/Sign_In/signin.dart';
import 'package:flutter/material.dart';
import 'package:doctor/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:doctor/screens/Sign_In/signin.dart';
import 'package:flutter/material.dart';
import 'package:doctor/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:doctor/models/patient.dart';
import 'package:provider/provider.dart';
import 'package:doctor/database.dart';
import 'package:doctor/screens/Doctor/presp.dart';

class settingsp extends StatefulWidget {
  @override
  _settingspState createState() => _settingspState();
}

class _settingspState extends State<settingsp> {
  final authentication auth = authentication(FirebaseAuth.instance);
  final String _uid = FirebaseAuth.instance.currentUser.uid;
  patient p;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<patient>>.value(
      value: DatabaseService().patientlist,
      initialData: [],
      builder: (context, patient) {
        return plist(context);
      },
    );
  }

  Widget plist(BuildContext context) {
    final appoints = Provider.of<List<patient>>(context);
    return new Scaffold(
      backgroundColor: Color(0xffEFF0F5),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: Colors.white, style: BorderStyle.solid, width: 1.0),
          color: Color(0xffEFF0F5),
          boxShadow: [
            BoxShadow(
              color: Color(0xffF0EFFE),
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
          ],
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: appoints.length,
                  itemBuilder: (context, index) {
                    if (appoints[index].puid == _uid) {
                      patient s = appoints[index];
                      p = s;
                      return Column(
                        children: [
                          SizedBox(height: 10),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://png.pngtree.com/png-clipart/20190628/original/pngtree-cute-cartoon-little-boy-medical-patient-in-wheelchair-png-image_4047851.jpg"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              height: 200,
                              width: 200,
                            ),
                          ),
                          Container(
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
                                  offset: Offset(2.0,
                                      2.0), // shadow direction: bottom right
                                )
                              ],
                            ),
                            height: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Name:      ${s.name}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xff4C3C88),
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat')),
                                  Text("Age:    ${s.age}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xff4C3C88),
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat')),
                                  Text("Blood Group:    ${s.bloodGroup}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xff4C3C88),
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat')),
                                  Text("Phone Number:    ${s.phoneNumber} ",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xff4C3C88),
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat')),
                                  Text("Gender:    ${s.gender} ",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xff4C3C88),
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat')),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      );
                    } else {
                      return Container();
                    }
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => (presp2(p))),
                );
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Container(
                  height: 50,
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
                        offset:
                            Offset(2.0, 2.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text('Prescriptions',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff4C3C88),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat')),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                await auth.signOut();
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Container(
                  height: 50,
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
                        offset:
                            Offset(2.0, 2.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text('Sign Out',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff4C3C88),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat')),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

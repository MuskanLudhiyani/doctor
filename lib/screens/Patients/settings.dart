import 'package:doctor/database.dart';
import 'package:doctor/models/patient.dart';
import 'package:doctor/screens/Sign_In/signin.dart';
import 'package:flutter/material.dart';
import 'package:doctor/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class settingsp extends StatefulWidget {
  @override
  _settingspState createState() => _settingspState();
}

class _settingspState extends State<settingsp> {
  final authentication auth = authentication(FirebaseAuth.instance);

  final String userid = FirebaseAuth.instance.currentUser.uid;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<patient>>.value(
      value: DatabaseService().patientlist,
      initialData: [],
      builder: (context, about) {
        return abouttt(context);
      },
    );
  }

  Widget abouttt(BuildContext context) {
    final plist = Provider.of<List<patient>>(context);
    if (plist.isEmpty || plist == null) {
      return CircularProgressIndicator();
    }
    return Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: plist.length,
                        itemBuilder: (context, index) {
                          if (plist[index].puid == userid) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Your Details",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat')),
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
                                    height: 250,
                                    width: 250,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Name:      ${plist[index].name}",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Color(0xff4C3C88),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat')),
                                        Text("Age:    ${plist[index].age}",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Color(0xff4C3C88),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat')),
                                        Text(
                                            "Blood Group:    ${plist[index].bloodGroup}",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Color(0xff4C3C88),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat')),
                                        Text(
                                            "Phone Number:    ${plist[index].phoneNumber} ",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Color(0xff4C3C88),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat')),
                                        Text(
                                            "Gender:    ${plist[index].gender} ",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Color(0xff4C3C88),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat')),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
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
                                            offset: Offset(2.0,
                                                2.0), // shadow direction: bottom right
                                          )
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Center(
                                            child: Text('Past Prescriptions',
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
                              ],
                            );
                          }
                        }))
              ],
            ),
          ),
        ),
        Container(
          child: GestureDetector(
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
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:doctor/database.dart';

class DoctorsInfo extends StatefulWidget {
  String doctoruid = '';
  String dname;
  DoctorsInfo(String s,String name)
  {
    doctoruid=s;
    dname=name;


  }


  @override
  _DoctorsInfoState createState() => _DoctorsInfoState();
}

class _DoctorsInfoState extends State<DoctorsInfo> {
  String puid = FirebaseAuth.instance.currentUser.uid;

  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();

  TextEditingController pname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text("Dr. ${widget.dname}",
                style: TextStyle(
                    fontSize: 20,
                    color:Color(0xff4C3C88),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat')),
          ),
          SizedBox(height: 20,),


          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Theme(
              data: ThemeData(
                primaryColor: Color(0xffFFFFFF),
                primaryColorDark: Color(0xffFFFFFF),
              ),
              child: TextField(
                  controller: pname,
                  cursorColor: Color(0xff90E5BF),
                  decoration: InputDecoration(
                      filled: true,
                      hintText: "Patient's Name",
                      suffixIcon: GestureDetector(
                        child: Text(
                          "",
                          style: TextStyle(
                            color: Color(0xff90E5BF),
                          ),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 15),
                      fillColor: Color(0xffFFFFFF),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                        const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ))),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Theme(
              data: ThemeData(
                primaryColor: Color(0xffFFFFFF),
                primaryColorDark: Color(0xffFFFFFF),
              ),
              child: TextField(
                  controller: date,
                  cursorColor: Color(0xff90E5BF),
                  decoration: InputDecoration(
                      filled: true,
                      hintText: "Date",
                      suffixIcon: GestureDetector(
                        child: Text(
                          "",
                          style: TextStyle(
                            color: Color(0xff90E5BF),
                          ),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 15),
                      fillColor: Color(0xffFFFFFF),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                        const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ))),
            ),
          ),
          SizedBox(height: 10,),
      Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Theme(
        data: ThemeData(
          primaryColor: Color(0xffFFFFFF),
          primaryColorDark: Color(0xffFFFFFF),
        ),
        child: TextField(
            controller: time,
            cursorColor: Color(0xff90E5BF),
            decoration: InputDecoration(
                filled: true,
                hintText: "Time",
                suffixIcon: GestureDetector(
                  child: Text(
                    "",
                    style: TextStyle(
                      color: Color(0xff90E5BF),
                    ),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 15),
                fillColor: Color(0xffFFFFFF),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius:
                  const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ))),
      ),
      ),
          SizedBox(height: 10,),

          GestureDetector(
            onTap: () async {
              try {
                await DatabaseService().updateAppointmentData(widget.dname,
                    pname.text, widget.doctoruid, puid, date.text, time.text, -1);
                Fluttertoast.showToast(msg: 'Added Appointment');
              } on FirebaseException catch (e) {
                Fluttertoast.showToast(msg: e.message);
                print(e);
              }
              Navigator.pop(context);
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
                      child: Text('Add Appointment',
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
      ),
    );
  }
}

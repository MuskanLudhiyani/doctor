import 'package:doctor/screens/Doctor/addprescriptions.dart';
import 'package:flutter/material.dart';
import 'package:doctor/models/patient.dart';
class ap extends StatefulWidget {
  @override
  _apState createState() => _apState();
  patient s;
  ap(patient p)
  {
    s=p;
  }
}

class _apState extends State<ap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFF0F5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("About",
              style: TextStyle(
                  fontSize: 25,
                  color:Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat')),

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
                  offset:
                  Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ],
            ),
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Name:      ${widget.s.name}",
                      style: TextStyle(
                          fontSize: 20,
                          color:Color(0xff4C3C88),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat')),
                  Text("Age:    ${widget.s.age}",
                      style: TextStyle(
                          fontSize: 20,
                          color:Color(0xff4C3C88),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat')),
                  Text("Blood Group:    ${widget.s.bloodGroup}",
                      style: TextStyle(
                          fontSize: 20,
                          color:Color(0xff4C3C88),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat')),
                  Text("Phone Number:    ${widget.s.phoneNumber} ",
                      style: TextStyle(
                          fontSize: 20,
                          color:Color(0xff4C3C88),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat')),
                  Text("Gender:    ${widget.s.gender} ",
                      style: TextStyle(
                          fontSize: 20,
                          color:Color(0xff4C3C88),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat')),


                ],
              ),
            ),
          ),


          GestureDetector(
            onTap: ()  {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => (addPrescription(widget.s))),
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
                      child: Text('Add Prescription',
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

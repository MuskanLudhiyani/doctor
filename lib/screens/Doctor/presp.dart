import 'package:doctor/models/prescription.dart';
import 'package:flutter/material.dart';
import 'package:doctor/database.dart';
import 'package:doctor/screens/Doctor/aboutpatient.dart';
import 'package:doctor/screens/Doctor/appointments.dart';
import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:doctor/models/patient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'addprescriptions.dart';
import 'addprescriptions.dart';
class presp extends StatefulWidget {
  @override
  _prespState createState() => _prespState();
  patient s;
  presp(patient p)
  { s=p;
  }
}

class _prespState extends State<presp> {
  @override


    TextEditingController controller = new TextEditingController();
    @override
    Widget build(BuildContext context) {
      return StreamProvider<List<prescription>>.value(
        value: DatabaseService().listp,
        initialData: [],
        builder: (context, patient) {
          return plist(context);
        },
      );
    }

    Widget plist(BuildContext context) {
      final appoints = Provider.of<List<prescription>>(context);
      if (appoints.isEmpty || appoints == null) {
        return CircularProgressIndicator();
      }
      return new Scaffold(
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: Colors.white, style: BorderStyle.solid, width: 1.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xffF0EFFE),
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: Offset(2.0, 2.0), // shadow direction: bottom right
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: appoints.length,
                      itemBuilder: (context, index) {
                        if (appoints[index]
                            .puid
                                .contains(widget.s.puid)) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Container(
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
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Center(
                                        child: Text('Doctor: ${appoints[index].dname}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Color(0xff4C3C88),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat')),
                                      ),
                                      Center(
                                        child: Text('Disease: ${appoints[index].disease}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Color(0xff4C3C88),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat')),
                                      ),
                                      Center(
                                        child: Text('${appoints[index].suggestions}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Color(0xff4C3C88),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat')),
                                      ),
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
                          return  Container();
                        }
                      }),
                ),
        GestureDetector(
            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => (addPrescription(widget.s))),
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
        )
              ],
            ),
          ),
        ),
      );
    }
  }

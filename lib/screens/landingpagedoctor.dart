import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:doctor/screens/Doctor/addpatient.dart';
import 'package:doctor/screens/Doctor/appointments.dart';
import 'package:doctor/screens/Doctor/searchpatients.dart';
import 'package:doctor/screens/Doctor/settings.dart';

class landingpagedoctor extends StatefulWidget {
  @override
  _landingpagedoctorState createState() => _landingpagedoctorState();
}

class _landingpagedoctorState extends State<landingpagedoctor> {
  final uid = FirebaseAuth.instance.currentUser.uid;

  int _selectedpage = 0;
  final pageoptions = [appointments(), addpatient(), searchp(), settingsd()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DocOn 12'),
        backgroundColor: Colors.black,
      ),
      body: pageoptions[_selectedpage],
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.people,
                  color: Colors.black54,
                ),
                title: Text(
                  'Appointments',
                  style: TextStyle(
                    fontFamily: 'sans',
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                  color: Colors.black54,
                ),
                title: Text(
                  'Add Patients',
                  style: TextStyle(
                    fontFamily: 'sans',
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.black54,
                ),
                title: Text(
                  'Search Patients',
                  style: TextStyle(
                    fontFamily: 'sans',
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Colors.black54,
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(
                    fontFamily: 'sans',
                  ),
                ))
          ],
          currentIndex: _selectedpage,
          selectedItemColor: Colors.red,
          onTap: (int index) {
            setState(() {
              _selectedpage = index;
            });
          },
          backgroundColor: Colors.black,
          iconSize: 25,
        ),
      ),
    );
  }
}

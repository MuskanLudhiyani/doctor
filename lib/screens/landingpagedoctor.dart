import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
  final pageoptions = [appointments(), searchp(), settingsd()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('DocOn')),
        backgroundColor: Color(0xff4C3C88),
      ),
      body: pageoptions[_selectedpage],
      bottomNavigationBar: Container(
        color: Colors.red,

        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.white,
          items: [

            BottomNavigationBarItem(
                icon: Icon(
                  Icons.people,
                  color: Colors.black,
                ),
                title: Text(
                  'Appointments',
                  style: TextStyle(
                    fontFamily: 'sans',
                  ),
                )),

            BottomNavigationBarItem(

                icon: Icon(
                  Icons.search,
                  color: Colors.black,
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
                  color: Colors.black,
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(
                    fontFamily: 'sans',
                  ),
                ))
          ],
          currentIndex: _selectedpage,
          selectedItemColor: Color(0xff4C3C88),
          onTap: (int index) {
            setState(() {
              _selectedpage = index;
            });
          },

          iconSize: 25,
        ),
      ),
    );
  }
}

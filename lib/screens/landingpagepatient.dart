import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:doctor/screens/Patients/appointments.dart';
import 'package:doctor/screens/Patients/makeappointment.dart';
import 'package:doctor/screens/Patients/searchdoctors.dart';
import 'package:doctor/screens/Patients/settings.dart';

class landingpagepatient extends StatefulWidget {
  @override
  _landingpagepatientState createState() => _landingpagepatientState();
}

class _landingpagepatientState extends State<landingpagepatient> {
  final uid = FirebaseAuth.instance.currentUser.uid;

  int _selectedpage = 0;
  final pageoptions = [appointments(), searchd(), settingsp()];
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
                  'Search Doctors',
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

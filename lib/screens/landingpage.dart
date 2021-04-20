import 'package:flutter/material.dart';
import 'package:doctor/screens/addpatient.dart';
import 'package:doctor/screens/appointments.dart';
import 'package:doctor/screens/searchpatients.dart';
import 'package:doctor/screens/settings.dart';

class landingpage extends StatefulWidget {
  @override
  _landingpageState createState() => _landingpageState();
}

class _landingpageState extends State<landingpage> {
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

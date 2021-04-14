import 'package:doctor/test.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signindoctor.dart';
import 'signinpatient.dart';
import 'authentication.dart';
import 'signindocscreen.dart';
import 'package:provider/provider.dart';

class error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Error();
  }
}

class Error extends StatefulWidget {
  @override
  _ErrorState createState() => _ErrorState();
}

class _ErrorState extends State<Error> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color(0xff9994FA),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.white70,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 40, 10, 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: NetworkImage(
                            "https://image.freepik.com/free-vector/404-error-page-found_24908-59517.jpg"),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signind()),
                            );
                          },
                          child: Text("Try Again",
                              style: TextStyle(
                                color: Colors.red,
                              )))
                    ],
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

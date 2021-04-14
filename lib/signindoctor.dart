import 'package:doctor/authentication.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert' as convert;
import 'main.dart';
import 'package:provider/provider.dart';
import 'test.dart';
import 'signindocscreen.dart';

class Signind extends StatefulWidget {
  @override
  _SignindState createState() => _SignindState();
}

class _SignindState extends State<Signind> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider<authentication>(
        create: (_) => authentication(FirebaseAuth.instance),
      ),
      StreamProvider(
        create: (context) => context.read<authentication>().authStateChanges,
      )
    ], child: AuthenticationWrapper());
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      print('signed in');
      return test();
    } else {
      return signindocscreen();
    }
  }
}

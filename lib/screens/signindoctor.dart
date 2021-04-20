import 'package:doctor/authentication.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'signindocscreen.dart';
import 'landingpage.dart';

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
      return landingpage();
    } else {
      return signindocscreen();
    }
  }
}
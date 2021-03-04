import 'package:doctor/test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'signindoctor.dart';
import 'package:provider/provider.dart';

class authentication{
  final FirebaseAuth _firebaseAuth;
  authentication(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signIn({String email, String pass}) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: pass);
      return 'Success';
    } on FirebaseException catch(e){
      print("error");
      return e.message;
    }
  }
  Future<String> signUp({String email, String pass}) async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pass);
      return "Signed Up";
    } on FirebaseException catch(e){
      return e.message;
    }
  }
}

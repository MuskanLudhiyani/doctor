import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(
    String name,
    int age,
    String gender,
    String phoneNumber,
    String bloodGroup,
  ) async {
    return await users
        .doc(uid)
        .set({
          'name': name,
          'age': age,
          'gender': gender,
          'phoneNumber': phoneNumber,
          'bloodGroup': bloodGroup
        })
        .then((value) => print("User added successfully"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}

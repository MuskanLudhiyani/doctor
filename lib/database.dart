import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference patients =
      FirebaseFirestore.instance.collection('patients');
  final CollectionReference doctors =
      FirebaseFirestore.instance.collection('doctors');

  Future updatePatientData(
    String name,
    int age,
    String gender,
    String phoneNumber,
    String bloodGroup,
  ) async {
    return await patients
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

  Future updateDoctorData(
    String name,
    String gender,
    String phoneNumber,
    String address,
    String speciality,
  ) async {
    return await doctors
        .doc(uid)
        .set({
          'name': name,
          'gender': gender,
          'phoneNumber': phoneNumber,
          'address': address,
          'speciality': speciality
        })
        .then((value) => print("User added successfully"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}

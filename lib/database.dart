import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference patients =
      FirebaseFirestore.instance.collection('patients');
  final CollectionReference doctors =
      FirebaseFirestore.instance.collection('doctors');
  final CollectionReference appointments =
      FirebaseFirestore.instance.collection('appointments');

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

  Future<bool> checkIfDoctor() {
    return doctors.doc(uid).get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print("doctor true");
        return true;
      } else {
        print("doctor false");
        return false;
      }
    });
  }

  Future<bool> checkIfPatient() async {
    return await patients
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print("patient true");
        return true;
      } else {
        print("patient false");
        return false;
      }
    });
  }

  Stream<QuerySnapshot> get appoints {
    return appointments.snapshots();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/models/appointment.dart';
import 'package:doctor/models/doctor.dart';
import 'package:doctor/models/patient.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference patients =
      FirebaseFirestore.instance.collection('patients');
  final CollectionReference doctors =
      FirebaseFirestore.instance.collection('doctors');
  final CollectionReference appointments =
      FirebaseFirestore.instance.collection('appointments');
  final CollectionReference prescriptions =
      FirebaseFirestore.instance.collection('prescriptions');

  Future updatePatientData(
    String puid,
    String name,
    int age,
    String gender,
    String phoneNumber,
    String bloodGroup,
  ) async {
    return await patients
        .doc(uid)
        .set({
          'puid': puid,
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
    String duid,
    String name,
    String gender,
    String phoneNumber,
    String address,
    String speciality,
  ) async {
    return await doctors
        .doc(uid)
        .set({
          'duid': duid,
          'name': name,
          'gender': gender,
          'phoneNumber': phoneNumber,
          'address': address,
          'speciality': speciality,
        })
        .then((value) => print("User added successfully"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future updateAppointmentData(
    String aid,
    String dname,
    String pname,
    String duid,
    String puid,
    String date,
    String time,
    int approved,
  ) async {
    return await appointments
        .doc(duid + puid)
        .set({
          'aid': aid,
          'dname': dname,
          'pname': pname,
          'doctor': duid,
          'patient': puid,
          'date': date,
          'time': time,
          'approved': approved,
        })
        .then((value) => print("Appointment added successfully"))
        .catchError((error) => print("Failed to add appointment: $error"));
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

  Stream<List<appointment>> get appoints {
    return appointments.snapshots().map(appointmentListFromSnapshot);
  }

  List<appointment> appointmentListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return appointment(
          aid: doc.data()['aid'] ?? '',
          date: doc.data()['date'] ?? '',
          dname: doc.data()['dname'] ?? '',
          doctor: doc.data()['doctor'] ?? '',
          patient: doc.data()['patient'] ?? '',
          pname: doc.data()['pname'] ?? '',
          time: doc.data()['time'] ?? '',
          approved: doc.data()['approved'] ?? -1);
    }).toList();
  }

  Stream<List<patient>> get patientlist {
    return patients.snapshots().map(patientListFromSnapshot);
  }

  List<patient> patientListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return patient(
          puid: doc.data()['puid'] ?? '',
          name: doc.data()['name'] ?? '',
          gender: doc.data()['gender'] ?? '',
          bloodGroup: doc.data()['bloodGroup'] ?? '',
          phoneNumber: doc.data()['phoneNumber'] ?? '',
          age: doc.data()['age'] ?? 0);
    }).toList();
  }

  Stream<List<doctor>> get doctorlist {
    return doctors.snapshots().map(doctorListFromSnapshot);
  }

  List<doctor> doctorListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return doctor(
          duid: doc.data()['duid'] ?? '',
          name: doc.data()['name'] ?? '',
          gender: doc.data()['gender'] ?? '',
          speciality: doc.data()['speciality'] ?? '',
          phoneNumber: doc.data()['phoneNumber'] ?? '',
          address: doc.data()['address'] ?? '');
    }).toList();
  }

  prescriptionListFromSnapshot() {
    return prescriptions.get();
  }

  Future addPrescriptionToPatient(String puid, String pname, String dname,
      String disease, String suggestions) async {
    return await prescriptions
        .doc(puid)
        .set({
          'puid': puid,
          'pname': pname,
          'dname': dname,
          'disease': disease,
          'suggestions': suggestions
        })
        .then((value) => print("Prescription added successfully"))
        .catchError((error) => print("Failed to add prescription: $error"));
  }
}

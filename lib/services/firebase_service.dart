

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {

  static const firestoreRef = 'attendees';

  CollectionReference attendees = FirebaseFirestore.instance.collection(firestoreRef);


  //save the data
  Future<DocumentReference?> saveAttendeeData(Map<String, dynamic> body) async {
    var response = await attendees.add(body);
    return response;
  }
}
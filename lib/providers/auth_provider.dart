

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewc_hoe/providers/base_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider extends BaseProvider {
  String? campus;
  String? community;
  String? userType;


  setCampus(String value) {
    campus = value;
    notifyListeners();
  }


  setUserType(String value) {
    userType = value;
    notifyListeners();
  }


  setCommunity(String? value) {
    community = value;
    notifyListeners();
  }

  clearRegData() {
    campus = null;
    community = null;
  }


  Future<bool> registerAttendee({String? name, String? phone, String? homeAddress}) async {
    Map<String, dynamic> mappedBody = {
      "fullName": name,
      "phoneNumber": phone,
      "address": homeAddress ?? "",
      "community": community ?? "",
      "campus": campus ?? "",
      "createdAt": DateTime.now(),
      "userType": userType
    };
    try{
      setUiState(UiState.loading);
      // final userCredential = await FirebaseAuth.instance.signInAnonymously();
      // if(userCredential.credential != null) {
      // }
      DocumentReference? response = await firebase.saveAttendeeData(mappedBody);
      if(response?.id != null) {
        clearRegData();
        setUiState(UiState.done);
        return true;
      }
    } on FirebaseAuthException catch(e){
      dialog.showSnackBar("Error", e.code);
      setUiState(UiState.done);
      return false;
    }on FirebaseException catch(e) {
      dialog.showSnackBar("Error", e.code);
      setUiState(UiState.done);
      return false;

    }
    return false;
  }
}
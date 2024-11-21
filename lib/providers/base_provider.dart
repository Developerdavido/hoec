
import 'package:ewc_hoe/services/dialog_service.dart';
import 'package:flutter/cupertino.dart';

import '../services/firebase_service.dart';

enum UiState {idle, loading, done, error}
class BaseProvider with ChangeNotifier{

  final firebase = FirebaseService();
  DialogService dialog = DialogService();

  UiState uiState = UiState.idle;

  bool get isLoading => uiState == UiState.loading;

  bool get done => uiState == UiState.done;

  bool get error => uiState == UiState.error;


  setUiState(UiState uiState) {
    this.uiState = uiState;
    notifyListeners();
  }


  updateUi(func) {
    func();
    notifyListeners();
  }
}
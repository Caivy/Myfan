import 'package:flutter/material.dart';

class App extends ChangeNotifier {
  var _isLoading = false;
  var _isRegister = true;
  var _isOTPScreen = false;
  var _VerificationCode = "";
  var _wrongPass = "";
  var _wrongNum = "";
  var _doc_id_num = "";
  var _doc_id_pass = "";
  var _sNumber = "";
  var _sUsername = "";

  get isLoading => _isLoading;
  get isRegister => _isRegister;
  get isOTPScreen => _isOTPScreen;
  get VerificationCode => _VerificationCode;
  get wrongPass => _wrongPass;
  get wrongNum => _wrongNum;
  get docid_num => _doc_id_num;
  get docid_pass => _doc_id_pass;
  get sNumber => _sNumber;
  get sUsername => _sUsername;

  Loading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Register(bool val) {
    _isRegister = val;
    notifyListeners();
  }

  OTPScreen(bool value) {
    _isOTPScreen = value;
    notifyListeners();
  }

  Verification(String value) {
    _VerificationCode = value;
    notifyListeners();
  }

  WrongPass(String value) {
    _wrongPass = value;
    notifyListeners();
  }

  WrongNum(String value) {
    _wrongNum = value;
    notifyListeners();
  }

  DocIdNum(String value) {
    _doc_id_num = value;
    notifyListeners();
  }

  DocIdPass(String value) {
    _doc_id_pass = value;
    notifyListeners();
  }

  Username(String value) {
    _sUsername = value;
    notifyListeners();
  }

  Number(String value) {
    _sNumber = value;
    notifyListeners();
  }
}

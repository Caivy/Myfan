import 'package:flutter/material.dart';

class App extends ChangeNotifier {
  bool _isLoading = false;
  bool _isRegister = true;
  bool _isOTPScreen = false;
  int _pageIndex = 0;
  String _VerificationCode = "";
  String _wrongPass = "";
  String _wrongNum = "";
  String _doc_id_num = "";
  String _doc_id_pass = "";
  String _sNumber = "";
  String _sUsername = "";
  String _username = "";

  bool get isLoading => _isLoading;
  bool get isRegister => _isRegister;
  bool get isOTPScreen => _isOTPScreen;
  String get VerificationCode => _VerificationCode;
  String get wrongPass => _wrongPass;
  String get wrongNum => _wrongNum;
  String get docid_num => _doc_id_num;
  String get docid_pass => _doc_id_pass;
  String get sNumber => _sNumber;
  String get sUsername => _sUsername;
  String get usernmae => _username;
  int get pageIndex => _pageIndex;

  PageIndex(int value) {
    _pageIndex = value;
    notifyListeners();
  }

  username(String value) {
    _username = value;
    notifyListeners();
  }

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

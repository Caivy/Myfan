import 'package:flutter/widgets.dart';
import 'package:myfan/services/app.dart';

class usermodel extends App {
  String? _phoneNumber;
  String? _password;
  String? _email;
  String? _userId;
  String? _displayName;
  String? _userName;
  String? _profilePic;
  String? _contact;
  String? _bio;
  String? _location;
  String? _dob;
  String? _createdAt;
  bool? _isVerified;
  int? _followers;
  int? _following;

  get phoneNumber => _phoneNumber;
  get password => _password;
  get email => _email;
  get userId => _userId;
  get displayName => _displayName;
  get userName => _userName;
  get profilePic => _profilePic;
  get contact => _contact;
  get bio => _bio;
  get location => _location;
  get dob => _dob;
  get createdAt => _createdAt;
  get isVerified => _isVerified;
  get follower => _followers;
  get following => _following;

  getPhone(String v) {
    _phoneNumber = v;
    notifyListeners();
  }

  getPass(String v) {
    _password = v;
    notifyListeners();
  }

  getEmail(String v) {
    _email = v;
    notifyListeners();
  }

  getUserId(String v) {
    _userId = v;
    notifyListeners();
  }

  getDisplayName(String v) {
    _displayName = v;
    notifyListeners();
  }

  getUsername(String v) {
    _userName = v;
    notifyListeners();
  }

  getProfilePic(String v) {
    _profilePic = v;
    notifyListeners();
  }
}

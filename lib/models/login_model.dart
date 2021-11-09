import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfan/screen/home_screen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore =
    FirebaseFirestore.instance;

Future login(
    BuildContext context,
    var number,
    var passwords,
    bool isNumberCorrects,
    bool isPasswordCorrects) async {
  var invalidCredentials = false;
  var phoneNumber = number.toString();
  var password = passwords.toString();
  var isNumber = false;
  var isPassword = false;
  var isNumberCorrect = isNumberCorrects;
  var isPasswordCorrect = isPasswordCorrects;
  await _firestore
      .collection('users')
      .where('phoneNumber',
          isEqualTo: phoneNumber)
      .get()
      .then((result) {
    isNumber = true;
    print("number is true");
  });
  await _firestore
      .collection('users')
      .where('password', isEqualTo: password)
      .get()
      .then((result) {
    if (result.docs.length > 0) {
      isPassword = true;
      print("password is true");
    }
  });
  if (isNumber == true) {
    if (isPassword == true) {
      print(
          "phoneNumber and Password is correct");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) =>
              homeScreen(),
        ),
        (route) => false,
      );
    }
  } else if (isNumber == false) {
    var isNumberCorrect = false;
  } else if (isPassword == false) {
    var isPasswordCorrect = false;
  }
}

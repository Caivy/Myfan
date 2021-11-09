import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfan/screen/home_screen.dart';

Future signInWithFacebook(
    BuildContext context) async {
  try {
    final LoginResult =
        await FacebookAuth.instance.login();
    final userData =
        await FacebookAuth.instance.getUserData();
    final FacebookAuthCredential =
        FacebookAuthProvider.credential(
            LoginResult.accessToken!.token);
    await FirebaseAuth.instance
        .signInWithCredential(
            FacebookAuthCredential);
    await FirebaseFirestore.instance
        .collection('users')
        .add({
      'email': userData['email'],
      'imageUrl': userData['picture']['data']
          ['url'],
      'name': userData['name'],
    });
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>
            homeScreen(),
      ),
      (route) => false,
    );
  } on FirebaseAuthException catch (e) {
    throw e;
  }
}

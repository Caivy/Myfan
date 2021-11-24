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
        .doc(userData['id'])
        .set({
      'email': userData['email'],
      'imageUrl': userData['picture']['data']
          ['url'],
      'username': userData['name'],
    }); 
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>
            homeScreen(userData['id']),
      ),
      (route) => false,
    );
  } on FirebaseAuthException catch (e) {
    throw e;
  }
}

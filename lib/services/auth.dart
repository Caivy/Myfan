import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:myfan/helper/enum.dart';
import 'package:myfan/models/user_model.dart';
import 'package:myfan/screen/home_screen.dart';
import 'package:myfan/services/app.dart';
import 'package:provider/provider.dart';

class Auth extends App {
  AuthStatus authtatus = AuthStatus.NOT_DETERMINED;
  FirebaseAuth _firebaseAuth =
      FirebaseAuth.instance;
  FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  Future signUp(UserModel userModel,
      BuildContext context, String number,
      {GlobalKey<ScaffoldState>?
          scaffoldKey}) async {
    App app =
        Provider.of<App>(context, listen: false);
    try {
      _firebaseAuth.verifyPhoneNumber(
          phoneNumber: number,
          verificationCompleted:
              (phoneAuthCredential) {
            _firebaseAuth
                .signInWithCredential(
                    phoneAuthCredential)
                .then((user) async => {
                      if (user != null)
                        {
                          //store registration details in firestore database
                          await _firestore
                              .collection('users')
                              .doc(_firebaseAuth
                                  .currentUser!.uid)
                              .set(
                                  userModel
                                      .toJson(),
                                  SetOptions(
                                      merge: true))
                              .then((value) => {
                                    app.Loading(
                                        false),
                                    app.Register(
                                        false),
                                    app.OTPScreen(
                                        false),
                                    AuthStatus
                                        .LOGGED_IN,
                                    Navigator
                                        .pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext
                                                context) =>
                                            homeScreen(),
                                      ),
                                      (route) =>
                                          false,
                                    )
                                  })
                              .catchError(
                                  (onError) => {
                                        debugPrint(
                                            'Error saving user to db.' +
                                                onError.toString())
                                      })
                        }
                    });
            print("Logined");
          },
          verificationFailed:
              (FirebaseAuthException error) {
            debugPrint('Erorr logging in: ' +
                error.toString());
            app.Loading(false);
          },
          codeSent: (String verificationId,
              int? resendToken) async {
            app.Loading(false);
            app.Verification(verificationId);
            print("code send");
          },
          // forceResendingToken: ,
          codeAutoRetrievalTimeout:
              (String verificationId) {
            app.Verification(verificationId);
            print("Timed Out");
          },
          timeout: Duration(seconds: 60));
    } catch (error) {
      print(error.toString());
    }
  }

  Future checkCredentials(
      BuildContext context,
      String Number,
      String username,
      GlobalKey<ScaffoldState>? scaffoldKey) async {
    Auth auth =
        Provider.of<Auth>(context, listen: false);
    App app =
        Provider.of<App>(context, listen: false);
    app.OTPScreen(true);
    var phoneNumber = '+855 ' + Number;

    UserModel userModel = UserModel(
      phoneNumber: Number,
      userName: username,
      bio: 'Edit profile to update bio',
      displayName: username,
      location: 'Somewhere in universe',
      isVerified: false,
    );
    await _firestore
        .collection('users')
        .where('phoneNumber', isEqualTo: Number)
        .get()
        .then((result) {
      if (result.docs.length > 0) {
        app.Number(
            "Phonenumber is already registered.");
      } else {
        app.Register(false);
        app.OTPScreen(true);
        auth.signUp(
          userModel,
          context,
          phoneNumber,
          scaffoldKey: scaffoldKey,
        );
      }
    });
    await _firestore
        .collection('users')
        .where('username', isEqualTo: username)
        .get()
        .then((result) {
      if (result.docs.length > 0) {
        app.Username(
            "Username is already taken. Please choose another name");
      } else {
        app.Register(false);
        app.OTPScreen(true);
        auth.signUp(
          userModel,
          context,
          phoneNumber,
          scaffoldKey: scaffoldKey,
        );
      }
    });
  }

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
      UserModel _userModel = UserModel(
          displayName: userData['name'],
          userName: '@' + userData['name'],
          profilePic: userData['picture']['data'],
          email: userData['email'],
          userId: userData['id']);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userData['id'])
          .set(_userModel.toJson());
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
}

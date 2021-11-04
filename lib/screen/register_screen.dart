import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfan/config/global.dart';
import 'package:myfan/models/beziercontainer.dart';
import 'package:myfan/screen/home_screen.dart';
import 'package:myfan/screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore =
    FirebaseFirestore.instance;

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key, this.title})
      : super(key: key);

  final String? title;

  @override
  _SignUpPageState createState() =>
      _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyOTP = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController nameController =
      new TextEditingController();
  final TextEditingController
      phoneNumberController =
      new TextEditingController();
  final TextEditingController passwordController =
      new TextEditingController();
  final TextEditingController otpController =
      new TextEditingController();

  var isLoading = false;
  var isResend = false;
  var isRegister = true;
  var isOTPScreen = true;
  var verificationCode = '';

  //Form controllers
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    nameController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    otpController.dispose();
    super.dispose();
  }

  var username = '';
  var phoneNumber = '';
  var password = '';

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        // var _firebaseauth = await auth.verifyPhoneNumber(
        // phoneNumber: phoneNumber,
        // verificationCompleted: verificationCompleted,
        // verificationFailed: verificationFailed,
        // codeSent: codeSent,
        // codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)
        singIn();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding:
            EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(5)),
            color: Palette.secondaryColor),
        child: Text(
          'Register Now',
          style: TextStyle(
              fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  void singIn() {
    // var _firebaseauth = await auth.verifyPhoneNumber(
    // phoneNumber: phoneNumber,
    // verificationCompleted: verificationCompleted,
    // verificationFailed: verificationFailed,
    // codeSent: codeSent,
    // codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    LoginPage()));
      },
      child: Container(
        margin:
            EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: GoogleFonts.roboto(
                  color: Palette.WHITE,
                  fontSize: 13),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: GoogleFonts.roboto(
                  color: Palette.secondaryColor,
                  fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return returnOTPScreen();
    // return isOTPScreen ? returnOTPScreen() : registerScreen();
  }

  Widget registerScreen() {
    final height =
        MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Palette.PrimaryColor,
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context)
                      .size
                      .height *
                  .15,
              right: -MediaQuery.of(context)
                      .size
                      .width *
                  .4,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.center,
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    Text("REGISTER",
                        style: GoogleFonts.ubuntu(
                            color: Palette.WHITE,
                            fontSize: 24,
                            fontWeight:
                                FontWeight.bold)),
                    SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets
                              .symmetric(
                                  vertical: 10),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                            children: <Widget>[
                              Text(
                                "Username",
                                style: TextStyle(
                                    fontWeight:
                                        FontWeight
                                            .bold,
                                    color: Palette
                                        .WHITE,
                                    fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    border:
                                        InputBorder
                                            .none,
                                    fillColor: Color(
                                        0xfff3f3f4),
                                    filled: true),
                                controller:
                                    nameController,
                              ),
                              SizedBox(
                                  height: 15),
                              Text(
                                "Phone Number",
                                style: TextStyle(
                                    fontWeight:
                                        FontWeight
                                            .bold,
                                    color: Palette
                                        .WHITE,
                                    fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    border:
                                        InputBorder
                                            .none,
                                    fillColor: Color(
                                        0xfff3f3f4),
                                    filled: true),
                                // onChanged:
                                //     (val) =>
                                //         setState(
                                //             () {
                                //           phoneNumber =
                                //               val;
                                //         })
                                controller:
                                    phoneNumberController,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Password",
                                style: TextStyle(
                                    fontWeight:
                                        FontWeight
                                            .bold,
                                    color: Palette
                                        .WHITE,
                                    fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    border:
                                        InputBorder
                                            .none,
                                    fillColor: Color(
                                        0xfff3f3f4),
                                    filled: true),
                                // onChanged:
                                //     (val) =>
                                //         setState(
                                //             () {
                                //           password =
                                //               val;
                                //         })
                                controller:
                                    passwordController,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    SizedBox(
                        height: height * .14),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget returnOTPScreen() {
    return Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          title: Text('Verify Your Phone Number'),
          backgroundColor: Palette.PrimaryColor,
        ),
        body: ListView(children: [
          Form(
            key: _formKeyOTP,
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center,
              children: [
                Container(
                    child: Padding(
                        padding: const EdgeInsets
                                .symmetric(
                            vertical: 10.0,
                            horizontal: 10.0),
                        child: Text(
                            !isLoading
                                ? "Enter OTP from SMS"
                                : "Sending OTP code SMS",
                            textAlign: TextAlign
                                .center))),
                !isLoading
                    ? Container(
                        child: Padding(
                        padding: const EdgeInsets
                                .symmetric(
                            vertical: 10.0,
                            horizontal: 10.0),
                        child: TextFormField(
                          enabled: !isLoading,
                          controller:
                              otpController,
                          keyboardType:
                              TextInputType
                                  .number,
                          inputFormatters: <
                              TextInputFormatter>[
                            FilteringTextInputFormatter
                                .digitsOnly
                          ],
                          initialValue: null,
                          autofocus: true,
                          decoration: InputDecoration(
                              labelText: 'OTP',
                              labelStyle: TextStyle(
                                  color: Colors
                                      .black)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter OTP';
                            }
                          },
                        ),
                      ))
                    : Container(),
                !isLoading
                    ? Container(
                        margin: EdgeInsets.only(
                            top: 40, bottom: 5),
                        child: Padding(
                            padding:
                                const EdgeInsets
                                        .symmetric(
                                    horizontal:
                                        10.0),
                            child:
                                new ElevatedButton(
                              onPressed:
                                  () async {
                                if (_formKeyOTP
                                    .currentState!
                                    .validate()) {
                                  // If the form is valid, we want to show a loading Snackbar
                                  // If the form is valid, we want to do firebase signup...
                                  setState(() {
                                    isResend =
                                        false;
                                    isLoading =
                                        true;
                                  });
                                  try {
                                    await _auth
                                        .signInWithCredential(PhoneAuthProvider.credential(
                                            verificationId:
                                                verificationCode,
                                            smsCode: otpController
                                                .text
                                                .toString()))
                                        .then(
                                            (user) async =>
                                                {
                                                  //sign in was success
                                                  // ignore: unnecessary_null_comparison
                                                  if (user != null)
                                                    {
                                                      //store registration details in firestore database
                                                      await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
                                                        'name': nameController.text.trim(),
                                                        'phonenumber': phoneNumberController.text.trim(),
                                                        'password': passwordController
                                                      }, SetOptions(merge: true)).then((value) => {
                                                            //then move to authorised area
                                                            setState(() {
                                                              isLoading = false;
                                                              isResend = false;
                                                            })
                                                          }),

                                                      setState(() {
                                                        isLoading = false;
                                                        isResend = false;
                                                      }),
                                                      Navigator.pushAndRemoveUntil(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (BuildContext context) => homeScreen(),
                                                        ),
                                                        (route) => false,
                                                      )
                                                    }
                                                })
                                        .catchError(
                                            (error) =>
                                                // ignore: invalid_return_type_for_catch_error
                                                {
                                                  setState(() {
                                                    isLoading = false;
                                                    isResend = true;
                                                  }),
                                                });
                                    setState(() {
                                      isLoading =
                                          true;
                                    });
                                  } catch (e) {
                                    setState(() {
                                      isLoading =
                                          false;
                                    });
                                  }
                                }
                              },
                              child:
                                  new Container(
                                color: Palette
                                    .PrimaryColor,
                                padding:
                                    const EdgeInsets
                                        .symmetric(
                                  vertical: 15.0,
                                  horizontal:
                                      15.0,
                                ),
                                child: new Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment
                                          .center,
                                  children: <
                                      Widget>[
                                    new Expanded(
                                      child: Text(
                                        "Submit",
                                        // ignore: unnecessary_null_comparison
                                        textAlign:
                                            TextAlign
                                                .center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )))
                    : Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        children: <Widget>[
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .center,
                              children: <Widget>[
                                CircularProgressIndicator(
                                  backgroundColor:
                                      Theme.of(
                                              context)
                                          .primaryColor,
                                )
                              ]
                                  .where((c) =>
                                      c != null)
                                  .toList(),
                            )
                          ]),
                isResend
                    ? Container(
                        margin: EdgeInsets.only(
                            top: 40, bottom: 5),
                        child: Padding(
                            padding:
                                const EdgeInsets
                                        .symmetric(
                                    horizontal:
                                        10.0),
                            child:
                                new ElevatedButton(
                              onPressed:
                                  () async {
                                setState(() {
                                  isResend =
                                      false;
                                  isLoading =
                                      true;
                                });
                                // await signUp();
                              },
                              child:
                                  new Container(
                                padding:
                                    const EdgeInsets
                                        .symmetric(
                                  vertical: 15.0,
                                  horizontal:
                                      15.0,
                                ),
                                child: new Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment
                                          .center,
                                  children: <
                                      Widget>[
                                    new Expanded(
                                      child: Text(
                                        "Resend Code",
                                        textAlign:
                                            TextAlign
                                                .center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )))
                    : Column()
              ],
            ),
          )
        ]));
  }
}

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

  TextEditingController nameController =
      new TextEditingController();
  TextEditingController phoneNumberController =
      new TextEditingController();
  TextEditingController passwordController =
      new TextEditingController();
  TextEditingController otpController =
      new TextEditingController();

  var isLoading = false;
  var isResend = false;
  var isRegister = true;
  var isOTPScreen = false;
  var verificationCode = '';
  var isPassword = true;

  //Form controllers
  @override
  void initState() {
    super.initState();

    nameController.addListener(() {
      setState(() {});
    });
    phoneNumberController.addListener(() {
      setState(() {});
    });
    passwordController.addListener(() {
      setState(() {});
    });
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

  Widget _submitButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isRegister = false;
          isOTPScreen = true;
          signUp();
        });
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
    return isOTPScreen
        ? returnOTPScreen()
        : registerScreen();
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
                                decoration:
                                    InputDecoration(
                                        prefixIcon:
                                            Icon(Icons
                                                .person),
                                        suffixIcon: nameController
                                                .text
                                                .isEmpty
                                            ? Container(
                                                width: 0,
                                              )
                                            : IconButton(
                                                onPressed: () => passwordController
                                                    .clear(),
                                                icon: Icon(Icons
                                                    .close)),
                                        border: InputBorder
                                            .none,
                                        fillColor:
                                            Color(
                                                0xfff3f3f4),
                                        filled:
                                            true),
                                keyboardType:
                                    TextInputType
                                        .name,
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
                                decoration:
                                    InputDecoration(
                                        prefixIcon:
                                            Icon(Icons
                                                .phone),
                                        hintText:
                                            "12345678",
                                        suffixIcon: phoneNumberController
                                                .text
                                                .isEmpty
                                            ? Container(
                                                width: 0,
                                              )
                                            : IconButton(
                                                onPressed: () => passwordController
                                                    .clear(),
                                                icon: Icon(Icons
                                                    .close)),
                                        border: InputBorder
                                            .none,
                                        fillColor:
                                            Color(
                                                0xfff3f3f4),
                                        filled:
                                            true),
                                keyboardType:
                                    TextInputType
                                        .phone,
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
                                decoration:
                                    InputDecoration(
                                        prefixIcon:
                                            Icon(Icons
                                                .password),
                                        border: InputBorder
                                            .none,
                                        suffixIcon:
                                            IconButton(
                                          icon: isPassword
                                              ? Icon(Icons.visibility_off)
                                              : Icon(Icons.visibility),
                                          onPressed:
                                              () =>
                                                  setState(() => isPassword = !isPassword),
                                        ),
                                        fillColor:
                                            Color(
                                                0xfff3f3f4),
                                        filled:
                                            true),
                                keyboardType:
                                    TextInputType
                                        .visiblePassword,
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
    CollectionReference users =
        _firestore.collection('users');
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
                                                if (user != null)
                                                  {
                                                    //store registration details in firestore database
                                                    await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
                                                      'username': nameController.text.trim(),
                                                      'phoneNumber': phoneNumberController.text.trim(),
                                                      'password': passwordController.text.trim(),
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
                                              });
                                } catch (e) {
                                  setState(() {
                                    isLoading =
                                        false;
                                  });
                                }
                              },
                              child:
                                  new Container(
                                padding:
                                    const EdgeInsets
                                        .symmetric(
                                  vertical: 15.0,
                                  horizontal: 10,
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
                                      Palette
                                          .PrimaryColor,
                                )
                              ]
                                  .where((c) =>
                                      c != null)
                                  .toList(),
                            )
                          ]),
                isResend
                    ? Container(
                        color:
                            Palette.PrimaryColor,
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
                                await signUp();
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

  Future signUp() async {
    setState(() {
      isLoading = true;
    });
    var phoneNumber = '+855 ' +
        phoneNumberController.text.toString();
    var verifyPhoneNumber =
        _auth.verifyPhoneNumber(
            phoneNumber: phoneNumber,
            verificationCompleted:
                (phoneAuthCredential) {
              //auto code complete (not manually)
              _auth
                  .signInWithCredential(
                      phoneAuthCredential)
                  .then((user) async => {
                        if (user != null)
                          {
                            //store registration details in firestore database
                            await _firestore
                                .collection(
                                    'users')
                                .doc(_auth
                                    .currentUser!
                                    .uid)
                                .set(
                                    {
                                      'username':
                                          nameController
                                              .text
                                              .trim(),
                                      'phoneNumber':
                                          phoneNumberController
                                              .text
                                              .trim(),
                                      'password':
                                          passwordController
                                              .text
                                              .trim(),
                                    },
                                    SetOptions(
                                        merge:
                                            true))
                                .then((value) => {
                                      //then move to authorised area
                                      setState(
                                          () {
                                        isLoading =
                                            false;
                                        isRegister =
                                            false;
                                        isOTPScreen =
                                            false;

                                        //navigate to is
                                        Navigator
                                            .pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                homeScreen(),
                                          ),
                                          (route) =>
                                              false,
                                        );
                                      })
                                    })
                                .catchError(
                                    (onError) => {
                                          debugPrint('Error saving user to db.' +
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
              setState(() {
                isLoading = false;
              });
            },
            codeSent: (String verificationId,
                int? resendToken) async {
              // Update the UI - wait for the user to enter the SMS code
              setState(() {
                isLoading = false;
                verificationCode = verificationId;
              });
              print("code send");
            },
            codeAutoRetrievalTimeout:
                (String verificationId) {
              verificationCode = verificationId;
              print("Timed Out");
            },
            timeout: Duration(seconds: 60));

    await verifyPhoneNumber;
  }
}

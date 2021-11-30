import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfan/config/global.dart';
import 'package:myfan/screen/home_screen.dart';

final TextEditingController
    phoneNumberController =
    new TextEditingController();
final TextEditingController
    confirmPasswordController =
    new TextEditingController();
final TextEditingController passwordController =
    new TextEditingController();
final FirebaseFirestore _firestore =
    FirebaseFirestore.instance;
final TextEditingController otpController =
    new TextEditingController();
final FirebaseAuth _auth = FirebaseAuth.instance;

final _formKey = GlobalKey<FormState>();
final _formKeyOTP = GlobalKey<FormState>();
final _scaffoldKey = GlobalKey<ScaffoldState>();

var isOTPScreen = false;
var verificationCode = '';
var isLoading = false;
var isResend = false;
var isForgot = true;
var passwordMatch = '';
var wrongPass = '';
var test;
var docid;

@override
void initState() {
  initState();
}

class forgotPassPage extends StatefulWidget {
  forgotPassPage({Key? key, this.title})
      : super(key: key);

  final String? title;

  @override
  _forgetPassState createState() =>
      _forgetPassState();
}

// ignore: camel_case_types
class _forgetPassState
    extends State<forgotPassPage> {
  @override
  Widget build(BuildContext context) {
    return isOTPScreen
        ? returnOTPScreen()
        : forgotPass(context);
  }

  Widget forgotPass(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Palette.PrimaryColor,
        appBar: AppBar(
          title: Text("Forgot Password",
              style: GoogleFonts.ubuntu(
                  color: Palette.WHITE,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
        ),
        body: Stack(children: [
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
                  SizedBox(height: height * .1),
                  SizedBox(height: 50),
                  Column(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(
                                vertical: 10),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                          children: <Widget>[
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
                                border:
                                    InputBorder
                                        .none,
                                fillColor: Color(
                                    0xfff3f3f4),
                                filled: true,
                                errorText:
                                    passwordMatch,
                                errorStyle:
                                    GoogleFonts
                                        .roboto(
                                  fontSize: 16,
                                  color:
                                      Colors.red,
                                ),
                              ),
                              controller:
                                  phoneNumberController,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  _submitButton(context)
                ],
              ),
            ),
          ),
        ]));
  }

  Widget _submitButton(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // setState(() {
        //   isForgot = false;
        //   isOTPScreen = true;
        // });
        // next(context);
        var phoneNumber =
            phoneNumberController.text.trim();
        await _firestore
            .collection('users')
            .where('phoneNumber',
                isEqualTo: phoneNumber)
            .get()
            .then((result) {
          if (result.docs.length > 0) {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) =>
            //             password(context)));
            setState(() {
              isForgot = false;
              isOTPScreen = true;
            });
            OTP(context);
          } else {
            setState(() {
              passwordMatch =
                  "Incorrect Phonenumber";
            });
          }
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
          'Next',
          style: GoogleFonts.roboto(
              color: Palette.WHITE, fontSize: 24),
        ),
      ),
    );
  }

  Widget _submitsButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        login(context);
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
          'Login',
          style: GoogleFonts.roboto(
              color: Palette.WHITE, fontSize: 24),
        ),
      ),
    );
  }

  Widget password(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Palette.PrimaryColor,
      appBar: AppBar(
          title: Text("Forgot Password",
              style: GoogleFonts.ubuntu(
                  color: Palette.WHITE,
                  fontSize: 24,
                  fontWeight: FontWeight.bold))),
      body: Stack(
        children: [
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
                  SizedBox(height: height * .1),
                  SizedBox(height: 50),
                  Column(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(
                                vertical: 10),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                          children: <Widget>[
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
                              decoration:
                                  InputDecoration(
                                border:
                                    InputBorder
                                        .none,
                                fillColor: Color(
                                    0xfff3f3f4),
                                filled: true,
                                errorText:
                                    passwordMatch,
                              ),
                              controller:
                                  passwordController,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Confirm Password",
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
                                border:
                                    InputBorder
                                        .none,
                                fillColor: Color(
                                    0xfff3f3f4),
                                filled: true,
                                errorText:
                                    passwordMatch,
                              ),
                              controller:
                                  confirmPasswordController,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _submitsButton(context)
                ],
              ),
            ),
          ),
        ],
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
                                try {
                                  await _auth
                                      .signInWithCredential(PhoneAuthProvider.credential(
                                          verificationId:
                                              verificationCode,
                                          smsCode: otpController
                                              .text
                                              .toString()))
                                      .then(
                                          (user) =>
                                              {
                                                if (user != null)
                                                  {
                                                    setState(() {
                                                      isLoading = false;
                                                      isResend = false;
                                                    }),
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => password(context)))
                                                  }
                                                else
                                                  {
                                                    setState(() {
                                                      isLoading = true;
                                                      isResend = true;
                                                    }),
                                                    print("error")
                                                  }
                                              });
                                } catch (e) {
                                  print(e
                                      .toString());
                                }
                              },
                              style: ElevatedButton
                                  .styleFrom(
                                      primary: Palette
                                          .secondaryColor),
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
                                // await signUp();
                              },
                              style: ElevatedButton
                                  .styleFrom(
                                      primary: Palette
                                          .secondaryColor),
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

  // ignore: non_constant_identifier_names
  Future OTP(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    var phoneNumber = '+855 ' +
        phoneNumberController.text.trim();
    var verifyPhoneNumber =
        _auth.verifyPhoneNumber(
            phoneNumber: phoneNumber,
            verificationCompleted:
                (phoneAuthCredential) {
              _auth
                  .signInWithCredential(
                      phoneAuthCredential)
                  .then((user) async => {
                        if (user != null)
                          {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             password(
                            //                 context))),
                            setState(() {
                              isLoading = false;
                              isForgot = false;
                              isOTPScreen = false;
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
            timeout: Duration(seconds: 100));

    await verifyPhoneNumber;
  }

  Future login(BuildContext context) async {
    if (passwordController.text.trim() ==
        confirmPasswordController.text.trim()) {
      await _firestore
          .collection('users')
          .where('phoneNumber',
              isEqualTo: phoneNumberController
                  .text
                  .trim())
          .get()
          .then((v) {
        try {
          v.docs.forEach((v) {
            setState(() {
              docid = v.id;
            });
            _firestore
                .collection('users')
                .doc(v.id)
                .update({
              'password':
                  passwordController.text.trim()
            });
            print("add");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        homeScreen()));
          });
        } catch (e) {
          print(e);
        }
      });
    } else {
      setState(() {
        passwordMatch = "Password does not match";
      });
    }
  }
}

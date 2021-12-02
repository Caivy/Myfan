import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfan/config/global.dart';
import 'package:myfan/models/beziercontainer.dart';
import 'package:myfan/models/launch_model.dart';
import 'package:myfan/models/models.dart';
import 'package:myfan/screen/home_screen.dart';
import 'package:myfan/screen/Auth/login_screen.dart';
import 'package:myfan/services/app.dart';
import 'package:myfan/services/auth.dart';
import 'package:provider/provider.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore =
    FirebaseFirestore.instance;

StreamController<UserModel> streamController =
    StreamController();

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
  final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();

  final TextEditingController nameController =
      new TextEditingController();
  final TextEditingController
      phoneNumberController =
      new TextEditingController();
  final TextEditingController passwordController =
      new TextEditingController();
  final TextEditingController otpController =
      new TextEditingController();
  Auth auth = Auth();
  var isLoading = false;
  var isResend = false;
  var isRegister = true;
  var isOTPScreen = false;
  var verificationCode = '';
  var isPassword = true;

  var sUsername = '';
  var sNumber = '';
  var sPass = '';

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
    App Apps =
        Provider.of<App>(context, listen: false);
    return GestureDetector(
      onTap: () {
        setState(() {
          Apps.OTPScreen(true);
          Apps.Loading(true);
        });

        auth.checkCredentials(
            context,
            phoneNumberController.text.trim(),
            nameController.text.trim(),
            _scaffoldKey);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
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
                builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
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
                  fontSize: 14),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: GoogleFonts.roboto(
                  color: Palette.secondaryColor,
                  fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<App>(
        builder: (context, App, child) =>
            App.isOTPScreen
                ? returnOTPScreen()
                : registerScreen());
  }

  Widget registerScreen() {
    final height =
        MediaQuery.of(context).size.height;
    return Consumer<App>(
        builder: (context, app, child) {
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
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20),
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
                        height: 20,
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
                                  style: Text_Style
                                      .text,
                                ),
                                SizedBox(
                                  height: 5,
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
                                          errorText: app
                                              .sUsername,
                                          errorStyle:
                                              GoogleFonts
                                                  .roboto(
                                            fontSize:
                                                16,
                                            color: Colors
                                                .red,
                                          ),
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

                                // SizedBox(
                                //     height: 15),
                                Text(
                                  "Phone Number",
                                  style: Text_Style
                                      .text,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  decoration:
                                      InputDecoration(
                                          prefixIcon:
                                              Icon(Icons
                                                  .phone),
                                          hintText:
                                              "11222333",
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
                                          errorText: app
                                              .sNumber,
                                          errorStyle:
                                              GoogleFonts
                                                  .roboto(
                                            fontSize:
                                                16,
                                            color: Colors
                                                .red,
                                          ),
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
                                // SizedBox(
                                //   height: 15,
                                // ),
                                Text(
                                  "Password",
                                  style: Text_Style
                                      .text,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextField(
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
                                          errorText:
                                              sPass,
                                          errorStyle:
                                              GoogleFonts
                                                  .roboto(
                                            fontSize:
                                                16,
                                            color: Colors
                                                .red,
                                          ),
                                          filled:
                                              true),
                                  obscureText:
                                      isPassword,
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
                      // SizedBox(
                      //   height: 20,
                      // ),
                      _submitButton(),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: GoogleFonts.roboto(
                              fontSize: 15,
                              color: Palette.WHITE),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  'By signing up you agree to our ',
                            ),
                            TextSpan(
                                text:
                                    'Terms of Service',
                                style: GoogleFonts
                                    .roboto(
                                  color:
                                      Colors.blue,
                                  fontSize: 15,
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        print(
                                            'Terms of Service"');
                                        urllauncher(
                                            "https://econoapps.com/term-of-service");
                                      }),
                            TextSpan(
                              text:
                                  ' and that you have read our ',
                            ),
                            TextSpan(
                                text:
                                    'Privacy Policy',
                                style: GoogleFonts
                                    .roboto(
                                  color:
                                      Colors.blue,
                                  fontSize: 15,
                                  // fontStyle:
                                  //     FontStyle.italic,
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        print(
                                            'Privacy Policy');
                                        urllauncher(
                                            "https://econoapps.com/privacy-and-policy");
                                      }),
                          ],
                        ),
                      ),
                      // SizedBox(height: height * .5),
                      SizedBox(
                        height: 10,
                      ),
                      _loginAccountLabel(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget returnOTPScreen() {
    CollectionReference users =
        _firestore.collection('users');
    var phoneNumber = '+855 ' +
        phoneNumberController.text.toString();
    Random random = new Random();
    int randomNumber = random.nextInt(8);

    UserModel userModel = UserModel(
      phoneNumber:
          phoneNumberController.text.trim(),
      userName: "@" + nameController.text.trim(),
      bio: 'Edit profile to update bio',
      displayName: nameController.text.trim(),
      location: 'Somewhere in universe',
      isVerified: false,
      password: passwordController.text.trim(),
    );
    return Consumer<App>(
        builder: (context, user, child) {
      return Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          title: Text('Verify Your Phone Number'),
          backgroundColor: Palette.PrimaryColor,
        ),
        body: Consumer<App>(
            builder:
                (context, App, child) => (ListView(
                        children: [
                          Form(
                            key: _formKeyOTP,
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .center,
                              children: [
                                Container(
                                    child: Padding(
                                        padding: const EdgeInsets
                                                .symmetric(
                                            vertical:
                                                10.0,
                                            horizontal:
                                                10.0),
                                        child: Text(
                                            !App.isLoading
                                                ? "Enter OTP from SMS"
                                                : "Sending OTP code SMS",
                                            style: Text_Style
                                                .Normal,
                                            textAlign:
                                                TextAlign.center))),
                                !App.isLoading
                                    ? Container(
                                        child:
                                            Padding(
                                        padding: const EdgeInsets
                                                .symmetric(
                                            vertical:
                                                10.0,
                                            horizontal:
                                                10.0),
                                        child:
                                            TextFormField(
                                          enabled: !App
                                              .isLoading,
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
                                          initialValue:
                                              null,
                                          autofocus:
                                              true,
                                          decoration: InputDecoration(
                                              labelText:
                                                  'OTP',
                                              labelStyle:
                                                  TextStyle(color: Colors.black)),
                                          validator:
                                              (value) {
                                            if (value!
                                                .isEmpty) {
                                              return 'Please enter OTP';
                                            }
                                          },
                                        ),
                                      ))
                                    : Container(),
                                !App.isLoading
                                    ? Container(
                                        margin: EdgeInsets.only(
                                            top: 40,
                                            bottom:
                                                5),
                                        child:
                                            Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal:
                                                        10.0),
                                                child:
                                                    new ElevatedButton(
                                                  onPressed: () async {
                                                    try {
                                                      await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: App.VerificationCode, smsCode: otpController.text.trim())).then((user) async => {
                                                            //sign in was success
                                                            // ignore: unnecessary_null_comparison
                                                            if (user != null)
                                                              {
                                                                //store registration details in firestore database
                                                                await users.doc(_auth.currentUser!.uid).set(userModel.toJson(), SetOptions(merge: true)).then((value) => {
                                                                      App.Loading(false),
                                                                    }),

                                                                App.Loading(false),

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
                                                      App.Loading(false);
                                                    }
                                                  },
                                                  child: new Container(
                                                    padding: const EdgeInsets.symmetric(
                                                      vertical: 15.0,
                                                      horizontal: 10,
                                                    ),
                                                    child: new Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        new Expanded(
                                                          child: Text(
                                                            "Submit",
                                                            // ignore: unnecessary_null_comparison
                                                            textAlign: TextAlign.center,
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
                                        children: <
                                            Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                CircularProgressIndicator(
                                                  backgroundColor: Palette.PrimaryColor,
                                                )
                                              ]
                                                  .where((c) =>
                                                      // ignore: unnecessary_null_comparison
                                                      c != null)
                                                  .toList(),
                                            )
                                          ]),
                                isResend
                                    ? Container(
                                        color: Palette
                                            .PrimaryColor,
                                        margin: EdgeInsets.only(
                                            top: 40,
                                            bottom:
                                                5),
                                        child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                            child: new ElevatedButton(
                                              onPressed:
                                                  () async {
                                                // setState(() {
                                                //   isResend =
                                                //       false;
                                                //   isLoading =
                                                //       true;
                                                // });
                                                App.Loading(false);
                                                await Auth().signUp(
                                                    userModel,
                                                    context,
                                                    phoneNumber);
                                              },
                                              child:
                                                  new Container(
                                                color:
                                                    Palette.PrimaryColor,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 15.0,
                                                  horizontal: 15.0,
                                                ),
                                                child:
                                                    new Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Expanded(
                                                      child: Text(
                                                        "Resend Code",
                                                        textAlign: TextAlign.center,
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
                        ]))),
      );
    });
  }

  Future checkCredentials() async {
    Auth Auths = Provider.of<Auth>(context);
    App Apps = Provider.of<App>(context);
    Apps.OTPScreen(true);
    var username = nameController.text.trim();
    // ignore: non_constant_identifier_names
    var Number = phoneNumberController.text.trim();
    var pass = passwordController.text.trim();
    var phoneNumber =
        '+855 ' + phoneNumberController.text.trim();

    UserModel userModel = UserModel(
      phoneNumber:
          phoneNumberController.text.trim(),
      userName: "@" + nameController.text.trim(),
      bio: 'Edit profile to update bio',
      displayName: nameController.text.trim(),
      location: 'Somewhere in universe',
      isVerified: false,
      password: passwordController.text.trim(),
    );
    await _firestore
        .collection('users')
        .where('phoneNumber', isEqualTo: Number)
        .get()
        .then((result) {
      if (result.docs.length > 0) {
        setState(() {
          sNumber =
              "Phonenumber is already registered.";
        });
      } else {
        Apps.Register(false);
        Apps.OTPScreen(true);
        Auths.signUp(
          userModel,
          context,
          phoneNumber,
          scaffoldKey: _scaffoldKey,
        );
      }
    });
    await _firestore
        .collection('users')
        .where('username', isEqualTo: username)
        .get()
        .then((result) {
      if (result.docs.length > 0) {
        sUsername =
            "Username is already taken. Please choose another name";
      } else {
        Apps.Register(false);
        Apps.OTPScreen(true);
        Auths.signUp(
          userModel,
          context,
          phoneNumber,
          scaffoldKey: _scaffoldKey,
        );
      }
    });
  }
}

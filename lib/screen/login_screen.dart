import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfan/config/global.dart';
import 'package:myfan/models/beziercontainer.dart';
import 'package:myfan/models/facebook_login_model.dart';
import 'package:myfan/screen/forgot_password_screen.dart';
import 'package:myfan/screen/home_screen.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:myfan/screen/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore =
    FirebaseFirestore.instance;

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, this.title})
      : super(key: key);

  final String? title;

  @override
  _LoginPageState createState() =>
      _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController =
      new TextEditingController();
  TextEditingController phoneNumberController =
      new TextEditingController();
  TextEditingController passwordController =
      new TextEditingController();

  var wrongNumber;
  var wrongPassword;
  var isNumber;
  var isPassword;
  var wrongPass = '';
  var wrongNum = '';

  bool isPasswords = true;

  @override
  void initState() {
    super.initState();

    phoneNumberController.addListener(() {
      setState(() {});
    });
    passwordController.addListener(() {
      setState(() {});
    });
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () {
        login();
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
          'LOGIN',
          style: GoogleFonts.roboto(
              color: Palette.WHITE, fontSize: 24),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _facebookButton() {
    return GestureDetector(
      onTap: () async {
        signInWithFacebook(context);
      },
      child: Container(
        height: 50,
        margin:
            EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(10)),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff1959a9),
                  borderRadius: BorderRadius.only(
                      bottomLeft:
                          Radius.circular(5),
                      topLeft:
                          Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('f',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight:
                            FontWeight.w400)),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff2872ba),
                  borderRadius: BorderRadius.only(
                      bottomRight:
                          Radius.circular(5),
                      topRight:
                          Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text(
                    'Log in with Facebook',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight:
                            FontWeight.w400)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    SignUpPage()));
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
              'Don\'t have an account ?',
              style: GoogleFonts.roboto(
                  color: Palette.WHITE,
                  fontSize: 13),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
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
    final height =
        MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Palette.PrimaryColor,
        body: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: -height * .15,
                  right: -MediaQuery.of(context)
                          .size
                          .width *
                      .4,
                  child: BezierContainer()),
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
                      SizedBox(
                          height: height * .2),
                      // Image.asset('assets/Logo1.png'),
                      Text('Login',
                          style:
                              GoogleFonts.ubuntu(
                                  color: Palette
                                      .WHITE,
                                  fontSize: 24,
                                  fontWeight:
                                      FontWeight
                                          .bold)),
                      SizedBox(height: 50),
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
                                  "Phone Number",
                                  style: TextStyle(
                                      fontWeight:
                                          FontWeight
                                              .bold,
                                      color: Palette
                                          .WHITE,
                                      fontSize:
                                          15),
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
                                            width:
                                                0,
                                          )
                                        : IconButton(
                                            onPressed: () => phoneNumberController
                                                .clear(),
                                            icon:
                                                Icon(Icons.close)),
                                    border:
                                        InputBorder
                                            .none,
                                    errorText:
                                        wrongNum,
                                    errorStyle:
                                        GoogleFonts
                                            .roboto(
                                      fontSize:
                                          16,
                                      color: Colors
                                          .red,
                                    ),
                                    fillColor: Color(
                                        0xfff3f3f4),
                                    filled: true,
                                  ),
                                  keyboardType:
                                      TextInputType
                                          .phone,
                                  controller:
                                      phoneNumberController,
                                ),
                                SizedBox(
                                    height: 10),
                                Text(
                                  "Password",
                                  style: TextStyle(
                                      fontWeight:
                                          FontWeight
                                              .bold,
                                      color: Palette
                                          .WHITE,
                                      fontSize:
                                          15),
                                ),
                                SizedBox(
                                  height: 10,
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
                                            icon: isPasswords
                                                ? Icon(Icons.visibility_off)
                                                : Icon(Icons.visibility),
                                            onPressed: () =>
                                                setState(() => isPasswords = !isPasswords),
                                          ),
                                          errorText:
                                              wrongPass,
                                          errorStyle:
                                              GoogleFonts
                                                  .roboto(
                                            fontSize:
                                                16,
                                            color:
                                                Colors.red,
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
                                  obscureText:
                                      isPasswords,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      _submitButton(),
                      Container(
                        padding:
                            EdgeInsets.symmetric(
                                vertical: 10),
                        alignment:
                            Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder:
                                        (context) =>
                                            forgotPassPage()));
                          },
                          child: Text(
                              'Forgot Password ?',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Palette
                                      .WHITE,
                                  fontWeight:
                                      FontWeight
                                          .w500)),
                        ),
                      ),
                      _divider(),
                      _facebookButton(),
                      SizedBox(
                          height: height * .055),
                      _createAccountLabel(),
                    ],
                  ),
                ),
              ),
              // Positioned(
              //     top: 40,
              //     left: 0,
              //     child: _backButton()),
            ],
          ),
        ));
  }

  Future login() async {
    var phoneNumber =
        phoneNumberController.text.trim();
    var password = passwordController.text.trim();
    await _firestore
        .collection('users')
        .where('phoneNumber',
            isEqualTo: phoneNumber)
        .get()
        .then((result) {
      if (result.docs.length > 0) {
        setState(() {
          isNumber = true;
          print("number is true");
        });
      } else {
        setState(() {
          wrongNum = "Incorrect PhoneNumber";
        });
      }
    });
    await _firestore
        .collection('users')
        .where('password', isEqualTo: password)
        .get()
        .then((result) {
      if (result.docs.length > 0) {
        setState(() {
          isPassword = true;
          print("password is true");
        });
      } else {
        setState(() {
          wrongPass = "Incorrect Password";
        });
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
        setState(() {
          wrongPass = '';
          wrongNum = '';
        });
      }
    }
  }
}

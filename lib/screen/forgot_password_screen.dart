import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfan/config/global.dart';
import 'package:myfan/screen/home_screen.dart';

TextEditingController phoneNumberController =
    new TextEditingController();
TextEditingController passwordOldController =
    new TextEditingController();
TextEditingController passwordNewController =
    new TextEditingController();
final FirebaseFirestore _firestore =
    FirebaseFirestore.instance;

// ignore: camel_case_types
class forgetPass extends StatelessWidget {
  const forgetPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                              ),
                              controller:
                                  phoneNumberController,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _submitButton(context)
                ],
              ),
            ),
          ),
        ]));
  }

  Widget _submitButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        next(context);
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
                              "Old Password",
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
                              ),
                              controller:
                                  passwordOldController,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "New Password",
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
                              ),
                              controller:
                                  passwordNewController,
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

  Future next(BuildContext context) async {
    var phoneNumber =
        phoneNumberController.text.trim();
    await _firestore
        .collection('users')
        .where('phoneNumber',
            isEqualTo: phoneNumber)
        .get()
        .then((result) {
      if (result.docs.length > 0) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    password(context)));
      }
    });
  }

  Future login(BuildContext context) async {
    var oldPassword =
        passwordOldController.text.trim();
    await _firestore
        .collection('users')
        .where('password', isEqualTo: oldPassword)
        .get()
        .then((v) {
      try {
        v.docs.forEach((v) {
          _firestore
              .collection('users')
              .doc(v.id)
              .update({
            'password':
                passwordNewController.text.trim()
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
  }
}

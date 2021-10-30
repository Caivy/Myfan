import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfan/config/global.dart';
import 'package:myfan/models/beziercontainer.dart';
import 'package:myfan/screen/login_screen.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key, this.title})
      : super(key: key);

  final String? title;

  @override
  _SignUpPageState createState() =>
      _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Widget _entryField(String title,
      {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: <Widget>[
          Text(title,
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  color: Palette.WHITE,
                  fontSize: 15)),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  // border: OutlineInputBorder(
                  //     borderRadius:
                  //         BorderRadius.all(
                  //             Radius.circular(
                  //                 2))),
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
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

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'MY',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color(0xffe46b10)),
          children: [
            TextSpan(
              text: 'FAN',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Username"),
        _entryField("Phone Number"),
        _entryField("Password", isPassword: true),
      ],
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
                    _emailPasswordWidget(),
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
}

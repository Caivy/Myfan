import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfan/config/global.dart';

class login_sessions extends StatefulWidget {
  const login_sessions({Key? key})
      : super(key: key);

  @override
  _login_sessionsState createState() =>
      _login_sessionsState();
}

class _login_sessionsState
    extends State<login_sessions> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.WHITE,
        foregroundColor: Palette.BLACK,
        title: Text(
          "LOGIN SESSIONS",
          style: GoogleFonts.ubuntu(
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Divider(
            height: 10,
            thickness: 2,
            color: Palette.BLACK,
          ),
          SizedBox(
            height: 30,
          ),
          Divider(
            height: 10,
            thickness: 2,
            color: Palette.BLACK,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

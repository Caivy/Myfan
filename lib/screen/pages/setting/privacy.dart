import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfan/config/global.dart';

class privacy_safety extends StatelessWidget {
  const privacy_safety({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("PRIVACY AND SAFETY",
              style: GoogleFonts.ubuntu(
                  color: Palette.BLACK,
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
    );
  }
}

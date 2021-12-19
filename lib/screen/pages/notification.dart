import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfan/config/global.dart';
import 'package:myfan/services/usermodel.dart';
import 'package:provider/provider.dart';

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  _notificationState createState() =>
      _notificationState();
}

class _notificationState
    extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Consumer<usermodel>(
        builder: (context, usermodel, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Notification",
            style: GoogleFonts.ubuntu(
                color: Palette.BLACK,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Palette.WHITE,
        ),
      );
    });
  }
}

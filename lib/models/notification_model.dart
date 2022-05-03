import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:myfan/config/global.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Widget user_notification(
  String pfp,
  String displayName,
  String date,
  String post,
) {
  return ListTile(
    leading: CircleAvatar(
      radius: 25,
      foregroundImage: NetworkImage(pfp),
    ),
    title: Text(
      displayName,
      style: GoogleFonts.roboto(color: Palette.BLACK, fontSize: 18),
    ),
    subtitle: Text(
      date,
      style: GoogleFonts.roboto(color: Colors.grey, fontSize: 16),
    ),
  );
}

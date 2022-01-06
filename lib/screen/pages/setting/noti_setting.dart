import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfan/config/global.dart';

class noti_setting extends StatefulWidget {
  const noti_setting({Key? key})
      : super(key: key);

  @override
  _noti_settingState createState() =>
      _noti_settingState();
}

class _noti_settingState
    extends State<noti_setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.WHITE,
        foregroundColor: Palette.BLACK,
        title: Text("NOTIFICATIONS",
            style: GoogleFonts.ubuntu(
                color: Palette.BLACK,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Divider(
            height: 10,
            thickness: 2,
            color: Palette.BLACK,
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 15),
            child: Text(
              "Preferences",
              style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: Palette.BLACK,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text(
              "Push notifications",
              style: GoogleFonts.roboto(
                  color: Palette.BLACK,
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.keyboard_arrow_right,
                  color: Palette.BLACK,
                )),
          ),
          Divider(
            height: 10,
            thickness: 2,
            color: Palette.BLACK,
          ),
          ListTile(
            title: Text(
              "Email notifications",
              style: GoogleFonts.roboto(
                  color: Palette.BLACK,
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.keyboard_arrow_right,
                  color: Palette.BLACK,
                )),
          ),
          Divider(
            height: 10,
            thickness: 2,
            color: Palette.BLACK,
          ),
          ListTile(
            title: Text(
              "SMS notifications",
              style: GoogleFonts.roboto(
                  color: Palette.BLACK,
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.keyboard_arrow_right,
                  color: Palette.BLACK,
                )),
          ),
        ],
      ),
    );
  }
}

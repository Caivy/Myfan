import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfan/config/global.dart';

class display extends StatefulWidget {
  const display({Key? key}) : super(key: key);

  @override
  _displayState createState() => _displayState();
}

class _displayState extends State<display> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.WHITE,
        foregroundColor: Palette.BLACK,
        title: Text("PRIVACY AND SAFETY",
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
              "Customize your view",
              style: TextStyle(
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
              "Language",
              style: GoogleFonts.roboto(
                  color: Palette.BLACK,
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            subtitle: Text(
              "English",
              style: GoogleFonts.roboto(
                color: Palette.BLACK,
                fontSize: 16,
              ),
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
              "Darkmode",
              style: GoogleFonts.roboto(
                  color: Palette.BLACK,
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.toggle_off,
                  color: Palette.BLACK,
                )),
          ),
          Divider(
            height: 10,
            thickness: 2,
            color: Palette.BLACK,
          ),
        ],
      ),
    );
  }
}

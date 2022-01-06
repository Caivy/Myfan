import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:myfan/config/global.dart';

class facebook_account extends StatefulWidget {
  const facebook_account({Key? key})
      : super(key: key);

  @override
  _facebook_accountState createState() =>
      _facebook_accountState();
}

class _facebook_accountState
    extends State<facebook_account> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.WHITE,
        foregroundColor: Palette.BLACK,
        title: Text(
          "Facebook Account",
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
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            child: Container(
                width: size.width - 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Palette.PrimaryColor,
                    borderRadius:
                        BorderRadius.circular(10),
                    border: Border.all(
                        width: 1,
                        color:
                            Palette.PrimaryColor,
                        style:
                            BorderStyle.solid)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      LineIcons.facebook,
                      size: 40,
                      color: Palette.WHITE,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "khatit54@gmails.com",
                      style: GoogleFonts.roboto(
                          color: Palette.WHITE,
                          fontWeight:
                              FontWeight.normal,
                          fontSize: 20),
                    )
                  ],
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 10,
            thickness: 2,
            color: Palette.BLACK,
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.bottomRight,
                padding:
                    EdgeInsets.only(right: 20),
                child: Container(
                  height: 40,
                  width: 125,
                  decoration: BoxDecoration(
                      color:
                          Palette.secondaryColor,
                      borderRadius:
                          BorderRadius.circular(
                              13),
                      border: Border.all(
                          color: Palette
                              .secondaryColor,
                          style:
                              BorderStyle.solid)),
                  child: Center(
                    child: Text(
                      "DISCONNECT",
                      style: GoogleFonts.roboto(
                          color: Palette.BLACK,
                          fontSize: 18,
                          fontWeight:
                              FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

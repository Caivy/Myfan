import 'package:flutter/material.dart';
import 'package:myfan/config/global.dart';
import 'package:google_fonts/google_fonts.dart';

class change_username extends StatefulWidget {
  const change_username({Key? key})
      : super(key: key);

  @override
  _change_usernameState createState() =>
      _change_usernameState();
}

class _change_usernameState
    extends State<change_username> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.WHITE,
        foregroundColor: Palette.BLACK,
        title: Text(
          "CHANGE USERNAME",
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
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(10),
                  border: Border.all(
                      width: 2,
                      color: Palette.BLACK,
                      style: BorderStyle.solid)),
              child: TextField(
                decoration: InputDecoration(
                    hintText:
                        'Enter your new username',
                    hintStyle: TextStyle(
                        color: Palette.BLACK,
                        fontWeight:
                            FontWeight.normal,
                        fontSize: 18),
                    contentPadding:
                        EdgeInsets.all(15),
                    border: InputBorder.none),
                onChanged: (value) {},
              ),
            ),
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
                  width: 70,
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
                      "SAVE",
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

import 'package:flutter/material.dart';
import 'package:myfan/config/global.dart';

class change_emails extends StatefulWidget {
  const change_emails({Key? key}) : super(key: key);

  @override
  _change_emailsState createState() =>
      _change_emailsState();
}

class _change_emailsState
    extends State<change_emails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.WHITE,
        foregroundColor: Palette.BLACK,
        title: Text(
          "CHANGE USERNAME",
          style: TextStyle(
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
              width: 400,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(10),
                  border: Border.all(
                      width: 1,
                      color: Palette.BLACK,
                      style: BorderStyle.solid)),
              child: TextField(
                decoration: InputDecoration(
                    hintText:
                        'Enter your new Emails Address',
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
                padding: EdgeInsets.only(right: 20),
                child: Container(
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Palette.BLACK,
                      borderRadius:
                          BorderRadius.circular(13),
                      border: Border.all(
                          color: Palette.BLACK,
                          style:
                              BorderStyle.solid)),
                  child: Center(
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          color: Palette.WHITE,
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

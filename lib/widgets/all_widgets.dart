import 'package:flutter/material.dart';

import '../config/global.dart';

// ignore: camel_case_types
class allWidgets extends StatelessWidget {
  const allWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  height: 27,
                  width: 40,
                  decoration: BoxDecoration(
                      color:
                          Palette.secondaryColor,
                      borderRadius:
                          BorderRadius.circular(
                              20.0)),
                  child: Center(
                    child: Text(
                      "ALL",
                      style: TextStyle(
                          fontWeight:
                              FontWeight.bold,
                          fontFamily: "Roboto",
                          color: Colors.black),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0),
                child: Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius:
                          BorderRadius.circular(
                              20.0)),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.edit),
                    color: Colors.black,
                    iconSize: 20,
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          // Padding(padding: EdgeInsets.all(8.0)),

          SizedBox(
              child: IconButton(
                  onPressed: () {},
                  icon:
                      Icon(Icons.menu_outlined)))
        ],
      ),
    );
  }
}

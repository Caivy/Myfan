import 'package:flutter/material.dart';
import 'package:myfan/config/global.dart';

import 'package:myfan/widgets/all_widgets.dart';
import 'package:myfan/widgets/bottomappbar_widgets.dart';
import 'package:myfan/widgets/create_post_widgets.dart';

// ignore: camel_case_types
class homeScreen extends StatefulWidget {
  homeScreen(this.docID, {Key? key})
      : super(key: key);
  final String docID;

  @override
  _homeScreenState createState() =>
      _homeScreenState(this.docID);
}

// ignore: camel_case_types
class _homeScreenState extends State<homeScreen> {
  String docID;
  _homeScreenState(this.docID);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.WHITE,
        title: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "HOME",
              style: TextStyle(
                  fontSize: 22.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: Palette.BLACK),
            ),
            IconButton(
              icon: Icon(Icons.search_outlined),
              color: Palette.BLACK,
              iconSize: 28,
              onPressed: () {
                print(docID);
              },
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          createPost(),
          allWidgets(),
        ],
      ),
      bottomNavigationBar: bottomAppBar(),
    );
  }
}

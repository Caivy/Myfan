import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:myfan/screen/pages/feeds.dart';
import 'package:myfan/screen/pages/message.dart';
import 'package:myfan/screen/pages/notification.dart';

import 'package:myfan/services/app.dart';
import 'package:myfan/widgets/bottomappbar.dart';
import 'package:provider/provider.dart';

var index = 3;
var dummyImage =
    "https://i.pinimg.com/736x/c6/66/46/c666460b3c607b32f6c03c38b01e6c4d.jpg";
var dummyProfile =
    "https://www.virlan.co/trends/wp-content/uploads/2021/08/anime-pfp-cool.jpg";
String Caivy =
    "https://cdn.myanimelist.net/images/userimages/7597522.jpg?t=1638014400";

final FirebaseFirestore _firestore =
    FirebaseFirestore.instance;

PageController pageController = PageController();

CollectionReference<Map<String, dynamic>>
    collection = _firestore.collection('user');
String username = "";
String atUsername = "";

// ignore: camel_case_types
class homeScreen extends StatefulWidget {
  homeScreen();

  @override
  _homeScreenState createState() =>
      _homeScreenState();
}

// ignore: camel_case_types
class _homeScreenState extends State<homeScreen> {
  _homeScreenState();

  @override
  void initState() {
    App app =
        Provider.of<App>(context, listen: false);

    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed

    super.dispose();
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return feed();
      case 1:
        return notification();
      case 2:
        return message();

      default:
        return feed();
    }
  }

  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: _getPage(app.pageIndex),
        ),
      ),
      bottomNavigationBar:
          bottomAppBar(pageController),
    );
    // return Consumer<App>(
    //   builder: (context, app, child) => Scaffold(
    //     body: PageView(
    //       children: [
    //         feed(),
    //         notification(),
    //         message(),
    //       ],
    //       controller: pageController,
    //       onPageChanged: onPageChange,
    //       physics: NeverScrollableScrollPhysics(),
    //     ),
    //     bottomNavigationBar:
    //         bottomAppBar(pageController),
    //   ),
    // );
  }
}

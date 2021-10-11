import 'package:flutter/material.dart';
import 'package:myfan/global.dart';
import 'package:myfan/widgets/bottomappbar_widgets.dart';

// ignore: camel_case_types
class homeScreen extends StatefulWidget {
  homeScreen({Key? key}) : super(key: key);

  @override
  _homeScreenState createState() =>
      _homeScreenState();
}

// ignore: camel_case_types
class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                  color: Colors.black),
            ),
            IconButton(
              icon: Icon(Icons.search_outlined),
              color: Colors.black,
              iconSize: 28,
              onPressed: () {},
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          children: [
            Row(
              children: [
                Container(
                    height: 27,
                    width: 40,
                    decoration: BoxDecoration(
                        color: SECONDARY_COLOR,
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
                    padding: EdgeInsets.all(8.0)),
                Container(
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
                Padding(
                    // NEED TO CHANGE IT
                    padding: EdgeInsets.only(
                        right: 250.0)),
                SizedBox(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                            Icons.menu_outlined)))
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomAppBar(),
    );
  }
}

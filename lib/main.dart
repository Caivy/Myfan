import 'package:flutter/material.dart';
import 'package:myfan/models/hexToColor_models.dart';
import 'package:myfan/screen/home_screen.dart';

void main() {
  runApp(Myfan());
}

class Myfan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Myfan',
      theme: ThemeData(
          primaryColor:
              hexStringToColor("#09333f")),
      home: homeScreen(),
    );
  }
}

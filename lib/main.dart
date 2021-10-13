import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:myfan/models/hexToColor_models.dart';
import 'package:myfan/screen/home_screen.dart';
import 'package:myfan/screen/splash_screen.dart';

void main() {
  runApp(Myfan());
}

class Myfan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Myfan',
      home: Splash(),
    );
  }
}

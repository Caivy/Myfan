import 'package:flutter/material.dart';
import 'package:myfan/config/global.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.PrimaryColor,
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 10),
              child: Image.asset(
                  "assets/images/Logo1.png"),
            ),
          ),
        ],
      ),
    );
  }
}

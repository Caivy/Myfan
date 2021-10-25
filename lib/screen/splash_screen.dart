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
    final deviceHeight =
        MediaQuery.of(context).size.height;
    final deviceWidth =
        MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Palette.PrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: deviceHeight * 0.30,
              width: double.infinity,
              alignment: Alignment.center,
              child: FittedBox(
                child: Image.asset(
                  'assets/Logo1.png',
                  // width: 760,
                  // height: 742,
                ),
              ),
            ),
            Container(
              height: deviceHeight * 0.65,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}

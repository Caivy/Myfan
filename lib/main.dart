import 'package:flutter/material.dart';
import 'package:myfan/config/global.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:myfan/config/global.dart';
// import 'package:myfan/models/hexToColor_models.dart';
// import 'package:myfan/screen/home_screen.dart';
import 'package:myfan/screen/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myfan());
}

class Myfan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Myfan',
      theme: ThemeData(
        primaryColor: Palette.PrimaryColor,
      ),
      home: LoginPage(),
    );
  }
}

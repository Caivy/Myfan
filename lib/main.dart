// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myfan/config/global.dart';
import 'package:myfan/screen/Auth/splash_screen.dart';

import 'package:myfan/services/app.dart';
import 'package:myfan/services/auth.dart';
import 'package:myfan/services/post.dart';
import 'package:myfan/services/usermodel.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<App>(
          create: (_) => App()),
      ChangeNotifierProvider<Auth>(
          create: (_) => Auth()),
      ChangeNotifierProvider<Post>(
          create: (_) => Post()),
      ChangeNotifierProvider<usermodel>(
          create: (_) => usermodel()),
    ],
    child: Myfan(),
  ));
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
      home: splashScreen(),
    );
  }
}

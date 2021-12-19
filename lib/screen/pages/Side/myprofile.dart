import 'package:flutter/material.dart';
import 'package:myfan/services/usermodel.dart';
import 'package:provider/provider.dart';

class my_profile extends StatefulWidget {
  const my_profile({Key? key}) : super(key: key);

  @override
  _my_profileState createState() =>
      _my_profileState();
}

class _my_profileState extends State<my_profile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<usermodel>(
        builder: (context, usermodel, child) {
      return Scaffold(
        appBar: AppBar(title: Text("My Profile")),
        body: Center(
            child: Text(usermodel.displayName)),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:myfan/services/usermodel.dart';
import 'package:provider/provider.dart';

class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  _settingState createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return Consumer<usermodel>(
        builder: (context, usermodel, child) {
      return Scaffold(
        appBar: AppBar(title: Text("Settings")),
        body: Center(
            child: Text(usermodel.displayName)),
      );
    });
  }
}

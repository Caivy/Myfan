import 'package:flutter/material.dart';

class my_profile extends StatefulWidget {
  const my_profile({Key? key}) : super(key: key);

  @override
  _my_profileState createState() =>
      _my_profileState();
}

class _my_profileState extends State<my_profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        "MyProfile",
        style: TextStyle(fontSize: 22),
      )),
    );
  }
}

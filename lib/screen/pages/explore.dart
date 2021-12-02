import 'package:flutter/material.dart';

class explore extends StatefulWidget {
  const explore({Key? key}) : super(key: key);

  @override
  _exploreState createState() => _exploreState();
}

class _exploreState extends State<explore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Explore"),
      ),
    );
  }
}

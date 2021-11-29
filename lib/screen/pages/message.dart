import 'package:flutter/material.dart';

class message extends StatefulWidget {
  const message({Key? key}) : super(key: key);

  @override
  _messageState createState() => _messageState();
}

class _messageState extends State<message> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Message"),
      ),
    );
  }
}

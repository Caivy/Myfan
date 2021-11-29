import 'package:flutter/material.dart';

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  _notificationState createState() =>
      _notificationState();
}

class _notificationState
    extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Notifications"),
      ),
    );
  }
}

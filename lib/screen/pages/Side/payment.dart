import 'package:flutter/material.dart';

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  _paymentState createState() => _paymentState();
}

class _paymentState extends State<payment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        "Payment",
        style: TextStyle(fontSize: 22),
      )),
    );
  }
}

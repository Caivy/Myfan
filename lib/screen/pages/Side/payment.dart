import 'package:flutter/material.dart';
import 'package:myfan/services/usermodel.dart';
import 'package:provider/provider.dart';

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  _paymentState createState() => _paymentState();
}

class _paymentState extends State<payment> {
  @override
  Widget build(BuildContext context) {
    return Consumer<usermodel>(
        builder: (context, usermodel, child) {
      return Scaffold(
        appBar: AppBar(title: Text("Payment")),
        body: Center(
            child: Text(usermodel.displayName)),
      );
    });
  }
}

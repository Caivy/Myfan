import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myfan/config/global.dart';
import 'package:myfan/screen/home_screen.dart';
import 'package:myfan/widgets/navbar.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(
        context,
      ),
    );
  }
}

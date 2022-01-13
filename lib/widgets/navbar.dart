import 'package:flutter/material.dart';
import 'package:myfan/config/global.dart';

AppBar navBar(
  BuildContext context,
) {
  return AppBar(
    leading: BackButton(
      color: Palette.BLACK,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}

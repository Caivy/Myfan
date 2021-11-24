import 'package:flutter/material.dart';
import 'package:myfan/config/global.dart';

// ignore: camel_case_types
class bottomAppBar extends StatelessWidget {
  const bottomAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Palette.PrimaryColor,
        child: IconTheme(
          data: IconThemeData(color: Colors.white),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                tooltip: 'Home',
                iconSize: 24,
                icon:
                    const Icon(Icons.home_outlined),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Notification',
                iconSize: 24,
                icon: const Icon(
                    Icons.notifications_outlined),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Create Post',
                iconSize: 24,
                icon: const Icon(
                    Icons.add_box_outlined),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Message',
                iconSize: 24,
                icon: const Icon(
                    Icons.message_outlined),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Account',
                iconSize: 24,
                icon: const Icon(Icons.person),
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}

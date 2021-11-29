import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:myfan/config/global.dart';
import 'package:myfan/services/app.dart';

class bottomAppBar extends StatelessWidget {
  const bottomAppBar({
    Key? key,
    required this.pageController,
  }) : super(key: key);
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    App app =
        Provider.of<App>(context, listen: false);
    return BottomNavigationBar(
      currentIndex: app.pageIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_outlined),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box_outlined),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message_outlined),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
        ),
      ],
      elevation: 0.0,
      // color: Palette.PrimaryColor,
      // child: IconTheme(
      //   data: IconThemeData(color: Colors.white),
      //   child: Row(
      //     mainAxisAlignment:
      //         MainAxisAlignment.spaceEvenly,
      //     children: <Widget>[
      //       IconButton(
      //         tooltip: 'Home',
      //         iconSize: 24,
      //         icon:
      //             const Icon(Icons.home_outlined),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         tooltip: 'Notification',
      //         iconSize: 24,
      //         icon: const Icon(
      //             Icons.notifications_outlined),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         tooltip: 'Create Post',
      //         iconSize: 24,
      //         icon: const Icon(
      //             Icons.add_box_outlined),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         tooltip: 'Message',
      //         iconSize: 24,
      //         icon: const Icon(
      //             Icons.message_outlined),
      //         onPressed: () {},
      //       ),
      //       // IconButton(
      //       //   tooltip: 'Account',
      //       //   iconSize: 24,
      //       //   icon: const Icon(Icons.person),
      //       //   onPressed: () {},
      //       // ),
      //     ],
      //   ),
      // )
    );
  }

  onTap(int index) {
    pageController.jumpToPage(
      index,
    );
  }
}

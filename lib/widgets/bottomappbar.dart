import 'package:flutter/material.dart';
import 'package:myfan/config/global.dart';
import 'package:provider/provider.dart';
import 'package:myfan/services/app.dart';

class bottomAppBar extends StatefulWidget {
  bottomAppBar({Key? key}) : super(key: key);

  @override
  _bottomAppBarState createState() =>
      _bottomAppBarState();
}

class _bottomAppBarState
    extends State<bottomAppBar> {
  _bottomAppBarState();

  @override
  Widget build(BuildContext context) {
    App app =
        Provider.of<App>(context, listen: false);
    return BottomNavigationBar(
      currentIndex: app.pageIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Palette.PrimaryColor,
      unselectedItemColor: Palette.secondaryColor,
      selectedItemColor: Palette.WHITE,
      onTap: (index) {
        app.PageIndex(index);
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            tooltip: "Home Feeds"),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Explore",
            tooltip:
                "Find out what happen around you !"),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: "Notification",
          tooltip: "Notifications",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: "Messages",
          tooltip: "Messages",
        ),
      ],
      elevation: 0.0,
    );
  }
}

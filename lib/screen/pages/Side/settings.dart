import 'package:flutter/material.dart';
import 'package:myfan/screen/pages/setting/account.dart';
import 'package:myfan/screen/pages/setting/display.dart';
import 'package:myfan/screen/pages/setting/noti_setting.dart';
import 'package:myfan/screen/pages/setting/privacy.dart';
import 'package:myfan/screen/pages/setting/profile.dart';
import 'package:myfan/services/usermodel.dart';
import 'package:myfan/widgets/bottomappbar.dart';
import 'package:provider/provider.dart';

class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  _settingState createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return Consumer<usermodel>(
        builder: (context, usermodel, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: Column(
          children: [
            ListTile(
              title: Text(
                "Profile",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                profile()));
                  },
                  icon: Icon(Icons
                      .keyboard_arrow_right)),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            profile()));
              },
            ),
            Divider(
                height: 10,
                thickness: 2,
                color: Colors.black),
            ListTile(
              title: Text(
                "Account",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                account()));
                  },
                  icon: Icon(Icons
                      .keyboard_arrow_right)),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            account()));
              },
            ),
            Divider(
                height: 10,
                thickness: 2,
                color: Colors.black),
            ListTile(
              title: Text(
                "Privacy and Safety",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                privacy_safety()));
                  },
                  icon: Icon(Icons
                      .keyboard_arrow_right)),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            privacy_safety()));
              },
            ),
            Divider(
                height: 10,
                thickness: 2,
                color: Colors.black),
            ListTile(
              title: Text(
                "Notifications",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                noti_setting()));
                  },
                  icon: Icon(Icons
                      .keyboard_arrow_right)),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            noti_setting()));
              },
            ),
            Divider(
                height: 10,
                thickness: 2,
                color: Colors.black),
            ListTile(
              title: Text(
                "Display",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                display()));
                  },
                  icon: Icon(Icons
                      .keyboard_arrow_right)),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            display()));
              },
            ),
            Divider(
                height: 10,
                thickness: 2,
                color: Colors.black),
          ],
        ),
        bottomNavigationBar: bottomAppBar(),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:myfan/config/global.dart';
import 'package:myfan/screen/pages/setting/accounts/facebook_account.dart';
import 'package:myfan/screen/pages/setting/accounts/google_account.dart';
import 'package:myfan/screen/pages/setting/accounts/login_sessions.dart';

import 'accounts/chg_username.dart';
import 'accounts/chg_password.dart';
import 'accounts/chg_number.dart';
import 'accounts/chg_emails.dart';

class account extends StatelessWidget {
  const account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Palette.BLACK,
        title: Text(
          "ACCOUNT",
          style: TextStyle(
              color: Palette.BLACK,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Palette.WHITE,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(
                        horizontal: 15),
                child: Text(
                  "Account info",
                  style: TextStyle(
                      fontSize: 18,
                      color: Palette.BLACK,
                      fontWeight:
                          FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text(
                  "Username",
                  style: TextStyle(
                      color: Palette.BLACK,
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold),
                ),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  change_username()));
                    },
                    icon: Icon(
                        Icons
                            .keyboard_arrow_right,
                        color: Palette.BLACK)),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              change_username()));
                },
              ),
              Divider(
                  height: 10,
                  thickness: 2,
                  color: Palette.BLACK),
              ListTile(
                title: Text(
                  "Emails",
                  style: TextStyle(
                      color: Palette.BLACK,
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold),
                ),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  change_emails()));
                    },
                    icon: Icon(
                        Icons
                            .keyboard_arrow_right,
                        color: Palette.BLACK)),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              change_emails()));
                },
              ),
              Divider(
                  height: 10,
                  thickness: 2,
                  color: Palette.BLACK),
              ListTile(
                title: Text(
                  "Phone Number",
                  style: TextStyle(
                      color: Palette.BLACK,
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold),
                ),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  change_number()));
                    },
                    icon: Icon(
                        Icons
                            .keyboard_arrow_right,
                        color: Palette.BLACK)),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              change_number()));
                },
              ),
              Divider(
                  height: 10,
                  thickness: 2,
                  color: Palette.BLACK),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(
                        horizontal: 15),
                child: Text(
                  "Linked accounts",
                  style: TextStyle(
                      fontSize: 18,
                      color: Palette.BLACK,
                      fontWeight:
                          FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  "Facebook Account",
                  style: TextStyle(
                      color: Palette.BLACK,
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold),
                ),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  facebook_account()));
                    },
                    icon: Icon(
                        Icons
                            .keyboard_arrow_right,
                        color: Palette.BLACK)),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              facebook_account()));
                },
              ),
              Divider(
                  height: 10,
                  thickness: 2,
                  color: Palette.BLACK),
              ListTile(
                title: Text(
                  "Google Account",
                  style: TextStyle(
                      color: Palette.BLACK,
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold),
                ),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  google_account()));
                    },
                    icon: Icon(
                        Icons
                            .keyboard_arrow_right,
                        color: Palette.BLACK)),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              google_account()));
                },
              ),
              Divider(
                  height: 10,
                  thickness: 2,
                  color: Palette.BLACK),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(
                        horizontal: 15),
                child: Text(
                  "Security",
                  style: TextStyle(
                      fontSize: 18,
                      color: Palette.BLACK,
                      fontWeight:
                          FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text(
                  "Password",
                  style: TextStyle(
                      color: Palette.BLACK,
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold),
                ),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  change_password()));
                    },
                    icon: Icon(
                        Icons
                            .keyboard_arrow_right,
                        color: Palette.BLACK)),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              change_password()));
                },
              ),
              Divider(
                  height: 10,
                  thickness: 2,
                  color: Palette.BLACK),
              ListTile(
                title: Text(
                  "Login sessions",
                  style: TextStyle(
                      color: Palette.BLACK,
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold),
                ),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  login_sessions()));
                    },
                    icon: Icon(
                        Icons
                            .keyboard_arrow_right,
                        color: Palette.BLACK)),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              login_sessions()));
                },
              ),
              Divider(
                  height: 10,
                  thickness: 2,
                  color: Palette.BLACK),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(
                        horizontal: 15),
                child: Text(
                  "Account management",
                  style: TextStyle(
                      fontSize: 18,
                      color: Palette.BLACK,
                      fontWeight:
                          FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text(
                  "Delete account",
                  style: TextStyle(
                      color: Palette.BLACK,
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                        Icons
                            .keyboard_arrow_right,
                        color: Palette.BLACK)),
                onTap: () {},
              ),
            ]),
      ),
    );
  }
}

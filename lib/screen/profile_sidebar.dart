import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:myfan/config/global.dart';

import 'package:myfan/screen/home_screen.dart';
import 'package:myfan/screen/pages/Side/myprofile.dart';
import 'package:myfan/screen/pages/Side/settings.dart';
import 'package:myfan/screen/pages/Side/payment.dart';
import 'package:myfan/services/app.dart';
import 'package:myfan/services/auth.dart';
import 'package:myfan/services/usermodel.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types

class profile_sidebar extends StatelessWidget {
  const profile_sidebar({Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Auth _user = Auth();
    getUser(context);
    return Consumer<usermodel>(
        builder: (context, usermodel, child) {
      return Drawer(
        child: Material(
          color: Palette.WHITE,
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: Palette.BLACK,
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius
                                    .circular(
                              42 / 2,
                            ),
                            child:
                                CachedNetworkImage(
                              imageUrl:
                                  dummyProfile,
                              placeholder: (context,
                                      url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context,
                                      url, error) =>
                                  Icon(Icons.error),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pop();
                            },
                            icon: Icon(Icons.close))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              usermodel.displayName,
                              style: TextStyle(
                                  color:
                                      Palette.BLACK,
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                  fontSize: 18),
                            ),
                            Text(
                              usermodel.userName,
                              style: TextStyle(
                                  color:
                                      Colors.grey,
                                  fontSize: 14,
                                  fontWeight:
                                      FontWeight
                                          .normal),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons
                                .arrow_drop_down)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "5" + " Fans",
                          style: TextStyle(
                              color: Palette.BLACK,
                              fontSize: 14,
                              fontWeight: FontWeight
                                  .normal),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "20" + " Following",
                          style: TextStyle(
                              color: Palette.BLACK,
                              fontSize: 14,
                              fontWeight: FontWeight
                                  .normal),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 10,
                color: Palette.BLACK,
                thickness: 1,
              ),
              buildMenuItem(
                "My Profile",
                Icons.account_circle,
                onClicked: () =>
                    selectItem(context, 0),
              ),
              SizedBox(
                height: 5,
              ),
              buildMenuItem(
                "Settings",
                Icons.settings,
                onClicked: () =>
                    selectItem(context, 1),
              ),
              Divider(
                height: 10,
                color: Palette.BLACK,
                thickness: 1,
              ),
              buildMenuItem(
                "Your Cards",
                Icons.credit_card,
                onClicked: () =>
                    selectItem(context, 2),
              ),
              buildMenuItem(
                "Your Banks",
                Icons.account_balance,
                onClicked: () =>
                    selectItem(context, 3),
              ),
              Divider(
                height: 10,
                color: Palette.BLACK,
                thickness: 1,
              ),
              buildMenuItem(
                "Help and Support",
                Icons.help,
                onClicked: () =>
                    selectItem(context, 4),
              ),
              buildMenuItem(
                "Darkmode",
                Icons.nightlight,
                onClicked: () =>
                    selectItem(context, 5),
              ),
              buildMenuItem(
                "English",
                Icons.public,
                dropdown: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Palette.BLACK,
                      size: 22,
                    )),
                onClicked: () =>
                    selectItem(context, 6),
              ),
              Divider(
                height: 10,
                color: Palette.BLACK,
                thickness: 1,
              ),
              buildMenuItem(
                "Logout",
                Icons.logout,
                onClicked: () =>
                    selectItem(context, 7),
              ),
            ],
          ),
        ),
      );
    });
  }

  getUser(BuildContext context) async {
    App app =
        Provider.of<App>(context, listen: false);
    usermodel user = Provider.of<usermodel>(context,
        listen: false);
    var collection = FirebaseFirestore.instance
        .collection('users');
    var docSnapshot =
        await collection.doc(app.docid_num).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data =
          docSnapshot.data();

      user.getUsername(data?['userName']);
      user.getDisplayName(data?['displayName']);
      user.getPhone(data?['phoneNumber']);
      user.getProfilePic(data?['profilePic']);
    }
  }

  Widget buildMenuItem(String text, IconData icon,
      {IconButton? dropdown,
      VoidCallback? onClicked}) {
    final color = Palette.BLACK;
    final hoverColor = Colors.black12;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      trailing: dropdown,
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}

selectItem(BuildContext context, int i) {
  switch (i) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => my_profile()));
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => setting()));
      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => payment()));
      break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => payment()));
      break;
    case 4:
      print("Support");
      break;
    case 5:
      print("Darkmode");
      break;
    case 6:
      print("English");
      break;
    case 7:
      print("Logout");
      break;
    default:
  }
}

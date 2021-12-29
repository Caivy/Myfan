import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfan/config/global.dart';
import 'package:myfan/screen/home_screen.dart';
import 'package:myfan/services/usermodel.dart';
import 'package:provider/provider.dart';

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  _notificationState createState() =>
      _notificationState();
}

class _notificationState
    extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "NOTIFICATIONS",
            style: GoogleFonts.ubuntu(
                color: Palette.BLACK,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  size: 22,
                  color: Palette.BLACK,
                ))
          ],
          elevation: 0.0,
          backgroundColor: Palette.WHITE,
        ),
        backgroundColor: Palette.WHITE,
        body: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,
                  children: [
                    Column(children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.library_add_check,
                            size: 22,
                          )),
                      Text("All")
                    ]),
                    Column(children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.mode_comment,
                            size: 22,
                          )),
                      Text("Comment")
                    ]),
                    Column(children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.thumb_up,
                            size: 22,
                          )),
                      Text("Likes")
                    ]),
                    Column(children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons
                                .supervisor_account,
                            size: 22,
                          )),
                      Text("Subscribe")
                    ]),
                    Column(children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.attach_money,
                            size: 22,
                          )),
                      Text("Tips")
                    ]),
                    Column(children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.message_rounded,
                            size: 22,
                          )),
                      Text("Messages")
                    ]),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            // Divider(
            //   height: 5,
            //   thickness: 3,
            //   color: Palette.BLACK,
            // ),
            Column(
              children: [
                user(
                    Caivy,
                    "Caivy",
                    "Sunday at 3:46PM",
                    "Likes your recent post")
              ],
            )
          ],
        ));
  }

  Widget user(
    String url,
    String displayName,
    String date,
    String post,
  ) {
    return ListTile(
      leading: CircleAvatar(
        foregroundImage: NetworkImage(url),
      ),
      title: Text(displayName),
      subtitle: Text(date),
    );
  }
}

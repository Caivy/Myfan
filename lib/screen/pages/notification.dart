import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfan/config/global.dart';
import 'package:myfan/screen/home_screen.dart';
import 'package:myfan/services/usermodel.dart';
import 'package:provider/provider.dart';

class notification extends StatefulWidget {
  const notification({Key? key})
      : super(key: key);

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
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Column(children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons
                                .library_add_check,
                            size: 22,
                          )),
                      Text("All")
                    ]),
                    Spacer(),
                    Column(children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.mode_comment,
                            size: 22,
                          )),
                      Text("Comment"),
                    ]),
                    Spacer(),
                    Column(children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.thumb_up,
                            size: 22,
                          )),
                      Text("Likes")
                    ]),
                    Spacer(),
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
                    Spacer(),
                    Column(children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.attach_money,
                            size: 22,
                          )),
                      Text("Tips")
                    ]),
                    Spacer(),
                    Column(children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.message_rounded,
                            size: 22,
                          )),
                      Text("Messages")
                    ]),
                    Spacer()
                    // SizedBox(
                    //   width: 15,
                    // ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            // ListView.builder(itemBuilder: itemBuilder)
            Column(
              children: [
                user(
                    Caivy,
                    "Caivy",
                    "Sunday at 3:46PM",
                    "Likes your recent post"),
                user(
                    Caivy,
                    "Caivy",
                    "Sunday at 3:46PM",
                    "Likes your recent post"),
              ],
            )
          ],
        ));
  }

  // var users = [
  //   user(Caivy, "Caivy", "Sunday at 3:46PM",
  //       "Likes your recent post"),
  //   user(Caivy, "Caivy", "Sunday at 3:46PM",
  //       "Likes your recent post"),
  // ];

  Widget user(
    String url,
    String displayName,
    String date,
    String post,
  ) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        foregroundImage: NetworkImage(url),
      ),
      title: Text(
        displayName,
        style: GoogleFonts.roboto(
            color: Palette.BLACK, fontSize: 18),
      ),
      subtitle: Text(
        date,
        style: GoogleFonts.roboto(
            color: Colors.grey, fontSize: 16),
      ),
    );
  }
}

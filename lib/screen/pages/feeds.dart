import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfan/config/global.dart';
import 'package:myfan/services/app.dart';

import 'package:provider/provider.dart';
import 'package:line_icons/line_icons.dart';

import '../home_screen.dart';

class feed extends StatefulWidget {
  feed();

  @override
  _feedState createState() => _feedState();
}

class _feedState extends State<feed> {
  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height;
    double avatarDia = 48;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.WHITE,
        title: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: .10),
                child: Container(
                  width: avatarDia,
                  height: avatarDia,
                  decoration: BoxDecoration(
                    color: Palette.secondaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(
                      avatarDia / 2,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: Caivy,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget:
                          (context, url, error) =>
                              Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 17,
              ),
              Text(
                "HOME",
                style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Palette.BLACK),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: .10),
              child: IconButton(
                icon: Icon(Icons.search_outlined),
                color: Palette.BLACK,
                iconSize: 28,
                onPressed: () {
                  // print(docID);
                },
              ),
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: _postListView(),
    );
  }

  Widget _postAuthorRow() {
    const double avatarDia = 48;
    _getData();
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              // padding: EdgeInsets.all(8),
              padding: EdgeInsets.symmetric(
                  horizontal: 15, vertical: 10),
              child: Container(
                width: avatarDia,
                height: avatarDia,
                decoration: BoxDecoration(
                  color: Palette.secondaryColor,
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(
                    avatarDia / 2,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: dummyProfile,
                    placeholder: (context, url) =>
                        CircularProgressIndicator(),
                    errorWidget:
                        (context, url, error) =>
                            Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 0.10,
            ),
            Text(
              username,
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              atUsername,
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20),
          child: IconButton(
            padding:
                EdgeInsets.symmetric(horizontal: 5),
            iconSize: 28,
            icon:
                Icon(LineIcons.horizontalEllipsis),
            onPressed: () {},
          ),
        )
      ],
    );
  }

  Widget _postImage() {
    return AspectRatio(
      aspectRatio: 1,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: dummyImage,
      ),
    );
  }

  Widget _PostCaption() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 15, vertical: 4),
      child: Text(
        "Yo this is a testing caption for posts",
        style: GoogleFonts.roboto(
          fontSize: 17,
        ),
      ),
    );
  }

  Widget _PostEng() {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              iconSize: 26,
              icon: Icon(Icons.thumb_up),
              color: Colors.black,
              disabledColor: Colors.black,
              onPressed: () {},
            ),
            IconButton(
              iconSize: 26,
              icon: Icon(Icons.mode_comment),
              onPressed: () {},
            ),
            IconButton(
              iconSize: 28,
              icon: Icon(Icons.share_rounded),
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }

  Widget _postView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _postAuthorRow(),
        SizedBox(
          height: 2,
        ),
        _PostCaption(),
        SizedBox(
          height: 2,
        ),
        _postImage(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: _PostEng(),
        ),
      ],
    );
  }

  Widget _postListView() {
    return ListView.builder(
        itemCount: index,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.only(bottom: 10),
            child: _postView(),
          );
        });
  }

  Future _getData() async {
    App app =
        Provider.of<App>(context, listen: false);
    var collection = FirebaseFirestore.instance
        .collection('users');
    var docSnapshot =
        await collection.doc(app.docid_num).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data =
          docSnapshot.data();
      setState(() {
        username = data?['displayName'];
        atUsername = data?['userName'];
      });
      app.username(data?['displayName']);
    }
  }
}

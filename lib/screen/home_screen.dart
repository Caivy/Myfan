import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:myfan/config/global.dart';
import 'package:myfan/screen/pages/feeds.dart';
import 'package:myfan/screen/pages/notification.dart';
import 'package:myfan/screen/pages/post_add.dart';
import 'package:myfan/services/app.dart';

import 'package:myfan/widgets/bottomappbar_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

var index = 3;
var dummyImage =
    "https://i.pinimg.com/736x/c6/66/46/c666460b3c607b32f6c03c38b01e6c4d.jpg";
var dummyProfile =
    "https://www.virlan.co/trends/wp-content/uploads/2021/08/anime-pfp-cool.jpg";
String Caivy =
    "https://cdn.myanimelist.net/images/userimages/7597522.jpg?t=1638014400";

final FirebaseFirestore _firestore =
    FirebaseFirestore.instance;

PageController pageController = PageController();

CollectionReference<Map<String, dynamic>>
    collection = _firestore.collection('user');
String username = "";
String atUsername = "";

// ignore: camel_case_types
class homeScreen extends StatefulWidget {
  homeScreen(this.docID, {Key? key})
      : super(key: key);
  final String docID;

  @override
  _homeScreenState createState() =>
      _homeScreenState(this.docID);
}

// ignore: camel_case_types
class _homeScreenState extends State<homeScreen> {
  String docID;
  _homeScreenState(this.docID);

  @override
  void initState() {
    super.initState();
    // PageController pageController =
    //     PageController();
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    pageController.dispose();
    super.dispose();
  }

  onPageChange(int pageIndex) {
    App app =
        Provider.of<App>(context, listen: false);
    setState(() {
      pageIndex = app.pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height;
    double avatarDia = 48;
    return Consumer<App>(
      builder: (context, app, child) => Scaffold(
        body: PageView(
          children: [
            feed(),
            notification(),
            post_add(),
          ],
          controller: pageController,
          onPageChanged: onPageChange,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: bottomAppBar(
          pageController: pageController,
        ),
      ),
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
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              atUsername,
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 25),
          child: Icon(Icons.menu),
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
        await collection.doc(docID).get();
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

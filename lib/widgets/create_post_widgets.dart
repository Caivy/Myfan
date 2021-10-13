import 'package:flutter/material.dart';
import 'package:myfan/config/global.dart';

class createPost extends StatefulWidget {
  createPost({Key? key}) : super(key: key);

  @override
  _createPostState createState() =>
      _createPostState();
}

class _createPostState extends State<createPost> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 14.0, top: 10.0),
          child: Container(
            width: 428,
            height: 150,
            child: Text(
              "Compose new post...",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 24,
                  color: Palette.BLACK),
            ),
          ),
        ),
        SizedBox(
          child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.image)),
        ),
        SizedBox(
          child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu)),
        )
      ],
    );
  }
}

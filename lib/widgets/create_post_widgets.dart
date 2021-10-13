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
        Container(
          height: 140,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1),
                  top: BorderSide(
                    width: 1,
                  ))),
          child: Column(
            children: [
              Row(
                children: [
                  Align(
                    alignment:
                        Alignment.centerLeft,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(
                              top: 15,
                              left: 13.5,
                              bottom: 45.0),
                      child: Text(
                        "Compose new post...",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 24,
                            color: Palette.BLACK),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.image)),
                  ),
                  SizedBox(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.menu)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

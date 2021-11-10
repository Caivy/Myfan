import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfan/config/global.dart';
import 'register_screen.dart';
import 'login_screen.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Palette.PrimaryColor,
      body: Stack(children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.center,
            mainAxisAlignment:
                MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: height * 0.1,
              ),
              Column(
                children: [
                  Container(
                      margin:
                          EdgeInsets.symmetric(
                              vertical: .5),
                      child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                          children: <Widget>[
                            Image.asset(
                              'assets/Logo1.png',
                            ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder:
                                            (context) =>
                                                LoginPage()));
                              },
                              style: ElevatedButton
                                  .styleFrom(
                                      primary: Palette
                                          .secondaryColor),
                              child:
                                  new Container(
                                padding:
                                    const EdgeInsets
                                        .symmetric(
                                  vertical: 15.0,
                                  horizontal: 10,
                                ),
                                child: new Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment
                                          .center,
                                  children: <
                                      Widget>[
                                    new Expanded(
                                      child: Text(
                                        "LOGIN",
                                        textAlign:
                                            TextAlign
                                                .center,
                                        style: GoogleFonts.ubuntu(
                                            color: Palette
                                                .BLACK,
                                            fontSize:
                                                18,
                                            fontWeight:
                                                FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder:
                                            (context) =>
                                                SignUpPage()));
                              },
                              style: ElevatedButton
                                  .styleFrom(
                                      primary: Palette
                                          .secondaryColor),
                              child:
                                  new Container(
                                padding:
                                    const EdgeInsets
                                        .symmetric(
                                  vertical: 15.0,
                                  horizontal: 10,
                                ),
                                child: new Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment
                                          .center,
                                  children: <
                                      Widget>[
                                    new Expanded(
                                      child: Text(
                                        "REGISTER",
                                        textAlign:
                                            TextAlign
                                                .center,
                                        style: GoogleFonts.ubuntu(
                                            color: Palette
                                                .BLACK,
                                            fontSize:
                                                18,
                                            fontWeight:
                                                FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ]))
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}

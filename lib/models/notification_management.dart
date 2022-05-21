import 'dart:convert';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:myfan/config/global.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myfan/helper/enum.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';

Widget user_notification(
  String pfp,
  String displayName,
  String date,
  String post,
) {
  return ListTile(
    leading: CircleAvatar(
      radius: 25,
      foregroundImage: NetworkImage(pfp),
    ),
    title: Text(
      displayName,
      style: GoogleFonts.roboto(color: Palette.BLACK, fontSize: 18),
    ),
    subtitle: Text(
      date,
      style: GoogleFonts.roboto(color: Colors.grey, fontSize: 16),
    ),
  );
}

class SendNotification {
  Future<void> messageNotificationClassifier(NotificationType notificationTypes,
      {String textMsg = "",
      required String connectionToken,
      required String currAccountUserName}) async {
    switch (notificationTypes) {
      case NotificationType.NOT_DETERMINED:
        break;
      case NotificationType.Message:
        await sendNotification(
            token: connectionToken,
            title: "$currAccountUserName Send a Message",
            body: textMsg);
        break;
      case NotificationType.Comment:
        await sendNotification(
            token: connectionToken,
            title: "$currAccountUserName Comment on your messages",
            body: "");
        break;
      case NotificationType.Share:
        await sendNotification(
            token: connectionToken,
            title: "$currAccountUserName Share your post",
            body: "");
        break;
      case NotificationType.Follow:
        await sendNotification(
            token: connectionToken,
            title: "$currAccountUserName has followed you",
            body: "");
        break;
      case NotificationType.Mention:
        await sendNotification(
            token: connectionToken,
            title: "$currAccountUserName mention you",
            body: "");
        break;
      case NotificationType.Like:
        await sendNotification(
            token: connectionToken,
            title: "$currAccountUserName Like your post",
            body: "");
        break;
    }
  }

  Future<int> sendNotification(
      {required String token,
      required String title,
      required String body}) async {
    try {
      print("In Notification");

      final String _serverKey =
          "AAAAyXc-1K0:APA91bHfrn53OmcmgNKIT3H5Gt5Rah30msbtxbIP3RBDSZyeZwOPwPqAGRni5L6bAzM-kqD8x5B1Y7Gf85gPBePd9TDOHqaEi4iISaUcdixo3kKnNLaF_LSwma9uX6wO0Dl5KjNNH9q2";

      final Response response = await post(
        Uri.parse("https://fcm.googleapis.com/fcm/send"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Authorization": "key=$_serverKey",
        },
        body: jsonEncode(<String, dynamic>{
          "notification": <String, dynamic>{
            "body": body,
            "title": title,
          },
          "priority": "high",
          "data": <String, dynamic>{
            "click": "FLUTTER_NOTIFICATION_CLICK",
            "id": "1",
            "status": "done",
            "collapse_key": "type_a",
          },
          "to": token,
        }),
      );

      print("Response is: ${response.statusCode}   ${response.body}");

      return response.statusCode;
    } catch (e) {
      print("Error in Notification Send: ${e.toString()}");
      return 404;
    }
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:myfan/config/global.dart';
import 'package:myfan/screen/Auth/splash_screen.dart';

import 'package:myfan/services/app.dart';
import 'package:myfan/services/auth.dart';
import 'package:myfan/services/post.dart';
import 'package:myfan/services/usermodel.dart';
import 'package:provider/provider.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<App>(create: (_) => App()),
      ChangeNotifierProvider<Auth>(create: (_) => Auth()),
      ChangeNotifierProvider<Post>(create: (_) => Post()),
      ChangeNotifierProvider<usermodel>(create: (_) => usermodel()),
    ],
    child: Myfan(),
  ));
}

class Myfan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Myfan',
      theme: ThemeData(
        primaryColor: Palette.PrimaryColor,
      ),
      home: splashScreen(),
    );
  }
}

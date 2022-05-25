import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ForegroundNotificationManagement {
  AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title // description
      importance: Importance.high,
      playSound: true);

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidInitializationSettings =
      AndroidInitializationSettings("app_icon");

  ForegroundNotificationManagement() {
    final InitializationSettings _initializationSettings =
        InitializationSettings(android: _androidInitializationSettings);

    print("Foreground Notification Constructor");

    initAll(_initializationSettings);
  }

  initAll(InitializationSettings initializationSettings) async {
    final response = await _flutterLocalNotificationsPlugin.initialize(
        initializationSettings, onSelectNotification: (payload) async {
      print("On Select Notification Payload: $payload");
    });

    print("Local Notification Initialization Status: $response");
  }

  Future<void> showNotification(
      {required String title, required String body}) async {
    try {
      _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          color: Colors.blue,
          playSound: true,
          icon: '@mipmap/ic_launcher',
        ),
      );
      final NotificationDetails generalNotificationDetails =
          NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          color: Colors.blue,
          playSound: true,
          icon: '@mipmap/ic_launcher',
        ),
      );

      await _flutterLocalNotificationsPlugin
          .show(0, title, body, generalNotificationDetails, payload: title);
    } catch (e) {
      print("Foreground Notification Error :${e.toString()}");
    }
  }
}

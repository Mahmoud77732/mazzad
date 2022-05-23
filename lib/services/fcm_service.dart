import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import '../models/push_notification.dart';

class FcmService {
  static void registerNotifications(
      Future<void> Function(RemoteMessage)
          _firebaseMessagingBackgroundHandler) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings status = await messaging.getNotificationSettings();

    if (status.authorizationStatus == AuthorizationStatus.notDetermined) {
      await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
    }

    // what this do ?
    await FirebaseMessaging.instance.subscribeToTopic(
      Platform.isAndroid
          ? "android"
          : Platform.isIOS
              ? "ios"
              : "unknown_platform",
    );

    // the message can be handled via the onBackgroundMessage handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // listen to foreground stream when the user is authorized
    if (status.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen(
        (RemoteMessage message) {
          if (message.notification != null) {
            RemoteNotification? notification = message.notification;
            AndroidNotification? android = message.notification?.android;
            if (notification != null && android != null) {
              PushNotification pushNotification = PushNotification(
                body: message.notification!.body,
                title: message.notification!.title,
              );
            } else {
              if (kDebugMode) {
                print('the message have no body ${message.notification}');
              }
            }
          }
        },
      );
    } else {
      if (kDebugMode) {
        print(status.authorizationStatus.toString());
        print('User declined or has not accepted permission');
      }
    }
  }
}

import 'dart:io';

import 'package:cron/cron.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// This file is "main.dart"
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mazzad/components/auction_item.dart';
import 'package:mazzad/constants.dart';
import 'package:mazzad/firebase_options.dart';
import 'package:mazzad/models/push_notification.dart';
import 'package:mazzad/screens/onboard/on_board_screen.dart';
import 'package:mazzad/services/auth_service.dart';
import 'package:overlay_support/overlay_support.dart';

import './router.dart' as router;

// the handler of Bckg message its work on its isloate ' on its own thread '
// receive message when its on bckg
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  if (kDebugMode) {
    print('A Background message just showed up :  ${message.messageId}');
  }
}

void main() async {
  Logger.level = Level.error;

// firebase intilaization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  registerNotifications();

  // make the statusbar transparent for full visability
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  // to make the red error screen a bit funnier :DD
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
      child: Container(
        color: Colors.green,
        child: Center(
          child: Text(
            details.exception.toString(),
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  };

  var cron = Cron();

// to update the user token always while he is using the app
// every 20 min
  cron.schedule(
    Schedule.parse('*/1 * * * *'),
    () async {
      if (await AuthService.isLoggedIn) {
        AuthService.updateToken(refreshToken: await AuthService.refreshToken);
        if (kDebugMode) {
          print('every 1 minutes');
        }
      }
    },
  );

  // set the preferred orientations for our app , we make only portrait
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  ).then(
    (_) => runApp(
      const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(Status.scheuled.name);
    }
    return OverlaySupport(
      child: GetMaterialApp(
        //     showPerformanceOverlay: true,
        debugShowCheckedModeBanner: false,
        home: const OnBoardScreen(),
        theme: Constants.kMazzadTheme,
        title: 'Mazzad',
        onGenerateRoute: router.Router.onGenerateRoute,
      ),
    );
  }
}

void registerNotifications() async {
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

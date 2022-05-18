import 'dart:io';

import 'package:cron/cron.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import './/constants.dart';
import './/firebase_options.dart';
import './/models/push_notification.dart';
import './/screens/home/home_screen.dart';
import './/screens/login/login_screen.dart';
import './/services/auth_service.dart';
import './router.dart' as router;

// the handler of Bckg message its work on its isloate ' on its own thread '
// receive message when its on bckg
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  if (kDebugMode) {
    print('A Background message just showed up :  ${message.messageId}');
  }
}

bool? initScreen;
void main() async {
  Logger.level = Level.error;
  await GetStorage.init();

  // firebase intilaization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  registerNotifications();

  // transparent statusbar
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  // customize red err screen
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

  // update access_token each 20 min
  cron.schedule(
    Schedule.parse('*/20 * * * *'),
    () async {
      if (await AuthService.isLoggedIn) {
        AuthService.updateToken(refreshToken: await AuthService.refreshToken);
        if (kDebugMode) {
          print('every 1 minutes');
        }
      }
    },
  );

  // portrait only
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

  Future<Widget> getUser() async {
    if (initScreen == null || initScreen == false) {
      return const HomeScreen();
    }

    if (await AuthService.isLoggedIn) {
      int duration = await AuthService.box.read("duration");
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(duration);
      if (DateTime.now().isAfter(dateTime)) {
        String refreshToken = AuthService.box.read("refresh_token").toString();
        AuthService.updateToken(refreshToken: refreshToken);
      }
      return const HomeScreen();
    }

    return LoginScreen();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: getUser(),
        builder: (context, snapshot) => !snapshot.hasData
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : snapshot.connectionState == ConnectionState.done
                ? snapshot.data as Widget
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
      ),
      theme: Constants.kMazzadTheme,
      title: 'Mazzad',
      onGenerateRoute: router.Router.onGenerateRoute,
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

extension Uris on Uri {
  Uri withQueryParameters(Map<String, dynamic> queryParameters) {
    return Uri.parse(
        "$this/?${queryParameters.keys.map<String>((k) => "$k=${queryParameters[k]}").join("&")}");
  }
}

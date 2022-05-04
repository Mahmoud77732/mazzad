// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mazzad/constants.dart';
import 'package:mazzad/firebase_options.dart';
import 'package:mazzad/models/push_notification.dart';
import 'package:mazzad/screens/SignUp/signup_screen.dart';
import 'package:mazzad/screens/home/home_screen.dart';
import 'package:mazzad/screens/login/login_screen.dart';
import 'package:mazzad/screens/onboard/on_board_screen.dart';
import 'package:mazzad/shared/network/local/cache_helper.dart';
import 'package:mazzad/shared/network/remote/dio_helper.dart';
import 'package:mazzad/utils/main_bindings.dart';
import 'package:overlay_support/overlay_support.dart';

import './router.dart' as router;

// the handler of Bckg message its work on its isloate ' on its own thread '
// receive message when its on bckg
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A Background message just showed up :  ${message.messageId}');
}

void main() async {
  // Logger.level = Level.error;

  HttpOverrides.global = MyHttpOverrides();

// firebase intilaization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  DioHelper.init();
  await CacheHelper.init();

  // registerNotifications();

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

  String widget;
  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  // token is existed in shared/constants
  // now token is found in any where in app

  accessToken = CacheHelper.getData(key: 'access_token');
  refreshToken = CacheHelper.getData(key: 'refresh_token');
  intExpiresDate = CacheHelper.getData(key: 'expires_in');
  if (CacheHelper.getData(key: 'expiresDate') != null) {
    expiresDate = DateTime.parse(CacheHelper.getData(key: 'expiresDate'));
  } else {
    expiresDate = null;
  }

  if (onBoarding != null) {
    if (accessToken != null &&
        ((expiresDate != null)
            ? expiresDate!.isAfter(DateTime.now())
            : false)) {
      // widget = ShopLayout();
      widget = 'homescreen';
    } else {
      // if (refreshToken != null) {
      // DioHelper.refreshToken();
      // widget = 'shoplayout';
      // } else {

      CacheHelper.removeData(key: 'access_token');
      CacheHelper.removeData(key: 'refresh_token');
      CacheHelper.removeData(key: 'expires_in');
      CacheHelper.removeData(key: 'expiresDate');
      // widget = ShopLoginScreen();
      widget = 'loginscreen';
      // }
    }
  } else {
    CacheHelper.sharedPreferences.clear();
    // widget = OnBoardScreenMazzad();
    widget = 'onboardscreen';
  }

  // set the preferred orientations for our app , we make only portrait
  // SystemChrome.setPreferredOrientations(
  //   [
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ],
  // ).then(
  //   (_) => runApp(
  //     MyApp(startWidget: widget),
  //   ),
  // );

  runApp(MyApp(startWidget: widget));
}

class MyApp extends StatelessWidget {
  final String startWidget;
  MyApp({required this.startWidget});

  @override
  Widget build(BuildContext context) {
    // return OverlaySupport(
    // child: GetMaterialApp(
    return GetMaterialApp(
      title: 'Mazzad',
      // theme: Constants.kMazzadTheme,
      debugShowCheckedModeBanner: false,
      // home: const OnBoardScreen(),
      // onGenerateRoute: router.Router.onGenerateRoute,
      initialBinding: MainBindings(),
      initialRoute: '/$startWidget',
      getPages: [
        // GetPage(name: '/', page: () => ShopLayout(), middlewares: [
        // AuthMiddleware(),
        // SuperMiddleware(),
        // ]),
        // GetPage(name: '/shoplayout', page: () => ShopLayout()),
        GetPage(name: '/homescreen', page: () => HomeScreen()),
        GetPage(name: '/loginscreen', page: () => LoginScreen()),
        GetPage(name: '/signupscreen', page: () => SignupScreen()),
        GetPage(name: '/onboardscreen', page: () => OnBoardScreen()),
      ],
    );
    // ),
    // );
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
            // from the overlay_support, give styling to the notification
            // showSimpleNotification(
            //   Text(pushNotification.title!),
            //   leading: const Icon(Icons.book),
            //   subtitle: Text(pushNotification.body!),
            //   duration: const Duration(seconds: 2),
            // );

          } else {
            print('the message have no body ${message.notification}');
          }
        }
      },
    );
  } else {
    print(status.authorizationStatus.toString());
    print('User declined or has not accepted permission');
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mazzad/firebase_options.dart';
import 'package:mazzad/screens/onboard/on_board_screen.dart';

import './router.dart' as router;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // to get intialize the flutter fire so we could use all the firebase services in our porject
  // provide the firebase_options with currentPlatform to get its neat options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnBoardScreen(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: GoogleFonts.abhayaLibre(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 24.0,
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        textTheme: TextTheme(
          // thats for just a backup for the regular styling
          bodyText1: GoogleFonts.abhayaLibre(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
          // thats for regulra styling
          bodyText2: GoogleFonts.abel(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
          // thats for button styling
          button: GoogleFonts.abel(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
          // its for list tiles text
          subtitle1: GoogleFonts.abel(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            // fontSize: 16,
          ),
        ),
      ),
      title: 'Mazzad',
      onGenerateRoute: router.Router.onGenerateRoute,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mazzad/screens/onboard_screen/on_board_screen.dart';
import './size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardScreen(),
    );
  }
}

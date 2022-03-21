import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazzad/screens/Details/details_screen.dart';
import './screens/home/home_screen.dart';
import './screens/otb/otb_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

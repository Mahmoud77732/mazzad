import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazzad/controller/my_auctions_controller.dart';
import 'package:mazzad/controller/profile_controller.dart';

import './components/body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = 'profile_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: const Body(),
    );
  }
}

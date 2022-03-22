// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_local_variable, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unused_import, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShopScreen extends StatelessWidget {
  static const routeName = '/shop_screen';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Shop', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10.0),
              const Text('Coming Soon', style: TextStyle(fontSize: 30)),
              SizedBox(height: 80.0),
              SvgPicture.asset('assets/icons/shop.svg',
                  height: size.height * 0.43),
            ],
          ),
        ));
  }
}

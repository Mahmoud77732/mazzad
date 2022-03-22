// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key, required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset('assets/icons/main_top.png'),
            width: size.width * 0.35,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset('assets/icons/login_bottom.png'),
            width: size.width * 0.4,
          ),
          child,
        ],
      ),
    );
  }
}
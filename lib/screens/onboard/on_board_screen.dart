import 'package:flutter/material.dart';
import 'package:mazzad/size_config.dart';
import './components/body.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({Key? key}) : super(key: key);
  static const rountName = '/on_board_screen';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}

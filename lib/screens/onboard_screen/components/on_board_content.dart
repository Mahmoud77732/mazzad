import 'package:flutter/material.dart';
import 'package:mazzad/constants.dart';

class OnBoardContent extends StatelessWidget {
  final String? image;
  final String? text;

  const OnBoardContent({Key? key, required this.image, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'MAZZAD',
          style: TextStyle(
              color: Constants.kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
        Image.asset(image!),
        Text(text!),
      ],
    );
  }
}

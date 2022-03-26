import 'package:flutter/material.dart';

import '../size_config.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.name,
    required this.onPress,
    required this.icon,
    required this.color,
  }) : super(key: key);
  final String name;
  final VoidCallback onPress;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70,
          width: 70,
          child: TextButton(
            onPressed: onPress,
            child: Center(
              child: Icon(
                icon,
                size: getProportionateScreenHeight(35),
                color: color,
              ),
            ),
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: color.withOpacity(.3),
            ),
          ),
        ),
        Text(name),
      ],
    );
  }
}

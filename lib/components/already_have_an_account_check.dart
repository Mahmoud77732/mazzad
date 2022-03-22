import 'package:flutter/material.dart';

import '../constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final void Function() press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    required this.login,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          (login) ? 'Don\'t have an account? ' : 'Already have an account? ',
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            (login) ? 'Sign Up' : 'Sign In',
            style: const TextStyle(
              color: Constants.kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

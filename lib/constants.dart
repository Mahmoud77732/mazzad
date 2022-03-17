import 'package:flutter/material.dart';

import 'size_config.dart';

class Constants {
  // Colors
  static const kPrimaryColor = Color(0xFFFF7643);
  static const kSecondaryColor = Color(0xFFFF7643);
  static const kTextColor = Color(0xFF757575);
  // Durations
  static const kAnimationDuration = Duration(milliseconds: 200);

  // Form Errors
  final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static const String kEmailNullError = "Please Enter your email";
  static const String kInvalidEmailError = "Please Enter Valid Email";
  static const String kPassNullError = "Please Enter your password";
  static const String kShortPassError = "Password is too short";
  static const String kMatchPassError = "Passwords don't match";
  static const String kNamelNullError = "Please Enter your name";
  static const String kPhoneNumberNullError = "Please Enter your phone number";
  static const String kAddressNullError = "Please Enter your address";
  // size
  static const double kHorizontalSpacing = 15;

  //styles
  static final otpInputDecoration = InputDecoration(
    contentPadding:
        EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
    border: outlineInputBorder(),
    focusedBorder: outlineInputBorder(),
    enabledBorder: outlineInputBorder(),
  );

  static OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
      borderSide: BorderSide(color: kTextColor),
    );
  }
}

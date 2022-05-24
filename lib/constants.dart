import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';

import './models/bidder/bidder.dart';
import 'size_config.dart';

class Constants {
  static String get api => _api;
  static String get clientSecret => _clientSecret;
  static String get clientId => _clientId;

  static const String _api = 'https://mazzad.unidevs.co/api';
  static const String _clientSecret =
      '331ONKkzjiVKT52ZeReYYN9xCjsQo4iCTPmNICvU';
  static const String _clientId = '95f97367-73a9-475a-b817-16c0d567d697';
  static Map<String, String> get authHeaders => {
        "Content-Type": "application/json",
        "Accept": "application/json",
      };
  static Future<Map<String, String>> get profileHeader async => {
        // "Authorization": "Bearer ${await AuthService.token}",
        "Authorization":
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5NWY5NzM2Ny03M2E5LTQ3NWEtYjgxNy0xNmMwZDU2N2Q2OTciLCJqdGkiOiI5YmU2YWU5NDkwMGI4ZTJkMzAyYWZjM2Q0NmI0YWVmMjM0OGI0MWFiMzA4MjBkYWE5YzE3MDk5Y2VhODJjN2VkM2Q3YWM0NTA5YjgzZjk5NCIsImlhdCI6MTY1MzE2ODgzNy4zMDU3NTgsIm5iZiI6MTY1MzE2ODgzNy4zMDU3NjIsImV4cCI6MTY4NDcwNDgzNy4yOTU1MDMsInN1YiI6IjEiLCJzY29wZXMiOlsiKiJdfQ.1rtdXSm4LjQLBgLEhUv-nEDzbL07q4ig8__WMUvvOH5Rihk9Sz885m9wjJWnLoJRcU5x8MAbKZH7YhySrZYGdObZHOgzUoiGs9151VR2PZm27A7qryKZC_6LPge2S1K1ZDA9I6BgFtZ83xm1ewqUKw6MtEDv27_QOsY52G4f0kJbsn0PBJ6hnQzKG8gQ6Lk4s6Xt5hc3X0sL4ydb_litg6znfvCBQgLQemb3GeVGaqyO9dDkJxLYAIzdnRE-XGWVGBPYFzH644xT2_OLuKc0QxxHG4tJBM_L1Re1OSN1_nGgU0RuIxGDmS5hpjtLX_cP_qLrFD0GzjWuiAONBEK6DYJ4P9zZQfWQPxT0ihyo4FKJlfr79zrHUYmhzFYUTsxPv77CHC-uoxcBtAKsMK184Lz6BKqWYGhF3NMrlBTE2Os1HaNWOgWMLGRAGCh7WI-WdWlqeyHYjQIy0pg1hjdgAARdVwvGIynYK_EYQjnIHA67ZnkGJ9tvzeUoYXCUJbLG7A89Z4SyJT6wqOBI0xhs3om55TBickoJ-qcI9Y149wVS8bjDL5vPoM0p3QqPhI48IHBisQ86Z13GE3wS4--lDJ7zelwon2z5cT4trvYNJPVNuafYLbkc43RA4WNsGJtCTBQAw6d4kq5oELWeN_Sb-WqG3x2VSESl1sDwoG-D3mY",
      };
  static Future<Map<String, String>> get headers async => {
        // "Authorization": "Bearer ${await AuthService.token}",
        "Authorization":
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5NWY5NzM2Ny03M2E5LTQ3NWEtYjgxNy0xNmMwZDU2N2Q2OTciLCJqdGkiOiI5YmU2YWU5NDkwMGI4ZTJkMzAyYWZjM2Q0NmI0YWVmMjM0OGI0MWFiMzA4MjBkYWE5YzE3MDk5Y2VhODJjN2VkM2Q3YWM0NTA5YjgzZjk5NCIsImlhdCI6MTY1MzE2ODgzNy4zMDU3NTgsIm5iZiI6MTY1MzE2ODgzNy4zMDU3NjIsImV4cCI6MTY4NDcwNDgzNy4yOTU1MDMsInN1YiI6IjEiLCJzY29wZXMiOlsiKiJdfQ.1rtdXSm4LjQLBgLEhUv-nEDzbL07q4ig8__WMUvvOH5Rihk9Sz885m9wjJWnLoJRcU5x8MAbKZH7YhySrZYGdObZHOgzUoiGs9151VR2PZm27A7qryKZC_6LPge2S1K1ZDA9I6BgFtZ83xm1ewqUKw6MtEDv27_QOsY52G4f0kJbsn0PBJ6hnQzKG8gQ6Lk4s6Xt5hc3X0sL4ydb_litg6znfvCBQgLQemb3GeVGaqyO9dDkJxLYAIzdnRE-XGWVGBPYFzH644xT2_OLuKc0QxxHG4tJBM_L1Re1OSN1_nGgU0RuIxGDmS5hpjtLX_cP_qLrFD0GzjWuiAONBEK6DYJ4P9zZQfWQPxT0ihyo4FKJlfr79zrHUYmhzFYUTsxPv77CHC-uoxcBtAKsMK184Lz6BKqWYGhF3NMrlBTE2Os1HaNWOgWMLGRAGCh7WI-WdWlqeyHYjQIy0pg1hjdgAARdVwvGIynYK_EYQjnIHA67ZnkGJ9tvzeUoYXCUJbLG7A89Z4SyJT6wqOBI0xhs3om55TBickoJ-qcI9Y149wVS8bjDL5vPoM0p3QqPhI48IHBisQ86Z13GE3wS4--lDJ7zelwon2z5cT4trvYNJPVNuafYLbkc43RA4WNsGJtCTBQAw6d4kq5oELWeN_Sb-WqG3x2VSESl1sDwoG-D3mY",
        "Content-Type": "application/json",
        "Accept": "application/json",
        "OS_Name": Platform.operatingSystem,
        "OS_Version": Platform.operatingSystemVersion,
        "App_Version":
            await PackageInfo.fromPlatform().then((value) => value.version),
      };
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

  //padding and spacing
  static const SizedBox kBigVertcialSpacing = SizedBox(
    height: 30,
  );
  static const SizedBox kSmallVerticalSpacing = SizedBox(
    height: 15,
  );
  static const SizedBox kSmallHorizontalSpacing = SizedBox(
    width: 15,
  );
  static const SizedBox kTinyHorizontalSpacing = SizedBox(
    width: 5,
  );
  static const SizedBox kBigHorizontalSpacing = SizedBox(
    width: 30,
  );

  //styles
  static final otpInputDecoration = InputDecoration(
    contentPadding:
        EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
    border: outlineInputBorder(),
    focusedBorder: outlineInputBorder(),
    enabledBorder: outlineInputBorder(),
  );

  // static final appBarTextStyle =
  static OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
      borderSide: const BorderSide(color: kTextColor),
    );
  }

// App Theme
  static ThemeData kMazzadTheme = ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: GoogleFonts.roboto(
        color: Colors.black,
        fontWeight: FontWeight.w900,
        fontSize: 24.0,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: TextTheme(
      // thats for just a backup for the regular styling
      bodyText1: GoogleFonts.roboto(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
      // thats for regulra styling
      bodyText2: GoogleFonts.roboto(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
      // thats for button styling
      button: GoogleFonts.roboto(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
      // its for list tiles text
      subtitle1: GoogleFonts.roboto(
        color: Colors.black,
        fontWeight: FontWeight.w900,
        // fontSize: 16,
      ),
    ),
  );

//DUMMY DATA
  static const List<String> kDummyImgs = [
    'assets/images/home.jpg',
    'assets/images/product.jpeg',
    'assets/images/product1.png',
  ];

  static List<Bidder> kDummyTopFiveBidders = [
    Bidder(
        name: 'Bidder Name',
        price: '1080',
        date: DateTime.now(),
        image: 'assets/images/profile_pic.png'),
    Bidder(
        name: 'Bidder Name',
        price: '1080',
        date: DateTime.now(),
        image: 'assets/images/profile_pic.png'),
    Bidder(
        name: 'Bidder Name',
        price: '1080',
        date: DateTime.now(),
        image: 'assets/images/profile_pic.png'),
    Bidder(
        name: 'Bidder Name',
        price: '1080',
        date: DateTime.now(),
        image: 'assets/images/profile_pic.png'),
    Bidder(
        name: 'Bidder Name',
        price: '1080',
        date: DateTime.now(),
        image: 'assets/images/profile_pic.png'),
  ];
  static List<Bidder> kDummyBiddersList = [
    const Bidder(name: 'Malia Renault', price: '1080'),
    const Bidder(name: 'Malia Renault', price: '1080'),
    const Bidder(name: 'Malia Renault', price: '1080'),
    const Bidder(name: 'Malia Renault', price: '1080'),
    const Bidder(name: 'Malia Renault', price: '1080'),
    const Bidder(name: 'Malia Renault', price: '1080'),
    const Bidder(name: 'Malia Renault', price: '1080'),
    const Bidder(name: 'Malia Renault', price: '1080'),
    const Bidder(name: 'Malia Renault', price: '1080'),
    const Bidder(name: 'Malia Renault', price: '1080'),
    const Bidder(name: 'Malia Renault', price: '1080'),
    const Bidder(name: 'Malia Renault', price: '1080'),
    const Bidder(name: 'Malia Renault', price: '1080'),
    const Bidder(name: 'Malia Renault', price: '1080'),
    const Bidder(name: 'Malia Renault', price: '1080'),
    const Bidder(name: 'Malia Renault', price: '1080'),
  ];
}

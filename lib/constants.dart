import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mazzad/components/auction_item.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'models/bidder/bidder.dart';
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

  static Future<Map<String, String>> get headers async => {
        "Authorization":
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5NWY5NzM2Ny03M2E5LTQ3NWEtYjgxNy0xNmMwZDU2N2Q2OTciLCJqdGkiOiJiMTYyOTUyZTEzNTYzY2JkODUxYWU3YzMzY2Q2YWM3Yzc0NzAzOTMyNjRhODBhNDMyOGM1ZmUwZWFiMzlhYzBmNzBkYWZmOWI0Y2VlOWMxMSIsImlhdCI6MTY1MTgyOTcyMy42NDc1MTYsIm5iZiI6MTY1MTgyOTcyMy42NDc1MjEsImV4cCI6MTY4MzM2NTcyMy42MzI0NjksInN1YiI6IjEiLCJzY29wZXMiOlsiKiJdfQ.qUOayE95CVUzUgVN3d7euCXaBvBGRvfSSguBzjtpII2OqMQPYFtsZ6JL8Ln_g2tzxbW_eNJT53GR0cyLfOb4gXBrH8wnotZiLMndLQBE8B84a_C6j49yG4edwmNXtdNgNMFp11W7ZhTCNaqteFKK2Zy2WRtHgExAZXhCRkAbQmSwU5E1qZfyTfCwe2k_Wis4nKbO2IY5F0lnvhPi0cOkkneb8JXLp2WaeZ0t1E4SJezLkQ1dUHV7HbqH_cCSzppMjOQOYfWd-d-R6kQLNit2FkwhxYvalzIm_4YZLgkPXzvdJAi-T6_ClzelGld5AbKTnReBH6reKUGNelyAPcbWemta9hB5z3LsYP4m5Epvvy_GKU6oR8F4IPONC4mCWO5O72VDrzAwA3rn5QJkiG3NVP0G7bTLB2cG_N1W7_Ir6G1Jxu4E58bKSila-vIw_Sk5yvpRcO-qBigm0NQTN_4S00gq6NrsMkY-MSpLxQTBDRtwFUNmq36SZOcnd6XDqfAZhGfwK6Js1AHlzmIrjbOsRt6AcFmzrC10dyoDeuigsYHRf-9xASrWmm0WQvTlwxmln-DHVG4np_IwR5QKCGYMtQGyRcOdSOyYX4Tq2uXt4Mtuit9skyCENylOBwSMKzJyYg6vKixxpYzPAmNfentJD17rByfsaVzAaU4cK9BBTWk",
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
      titleTextStyle: GoogleFonts.abhayaLibre(
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
      bodyText1: GoogleFonts.abhayaLibre(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
      // thats for regulra styling
      bodyText2: GoogleFonts.abel(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
      // thats for button styling
      button: GoogleFonts.abel(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
      // its for list tiles text
      subtitle1: GoogleFonts.abel(
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

  static List<AuctionItem> kDummyLiveAuctionItems = [
    const AuctionItem(
      image: 'assets/images/product.jpeg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.live,
    ),
    const AuctionItem(
      image: 'assets/images/slider1.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.live,
    ),
    const AuctionItem(
      image: 'assets/images/slider2.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.live,
    ),
    const AuctionItem(
      image: 'assets/images/slider3.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.live,
    ),
    const AuctionItem(
      image: 'assets/images/product.jpeg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.live,
    ),
    const AuctionItem(
      image: 'assets/images/slider1.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.live,
    ),
    const AuctionItem(
      image: 'assets/images/slider2.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.live,
    ),
    const AuctionItem(
      image: 'assets/images/slider3.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.live,
    ),
    const AuctionItem(
      image: 'assets/images/product.jpeg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.live,
    ),
    const AuctionItem(
      image: 'assets/images/slider1.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.live,
    ),
    const AuctionItem(
      image: 'assets/images/slider2.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.live,
    ),
    const AuctionItem(
      image: 'assets/images/slider3.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.live,
    ),
    const AuctionItem(
      image: 'assets/images/product.jpeg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.live,
    ),
    const AuctionItem(
      image: 'assets/images/slider1.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.live,
    ),
    const AuctionItem(
      image: 'assets/images/slider2.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.live,
    ),
    const AuctionItem(
      image: 'assets/images/slider3.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.live,
    ),
  ];
  static List<AuctionItem> kDummyScheduledAuctionItems = [
    const AuctionItem(
      image: 'assets/images/product.jpeg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.scheuled,
    ),
    const AuctionItem(
      image: 'assets/images/slider1.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.scheuled,
    ),
    const AuctionItem(
      image: 'assets/images/slider2.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.scheuled,
    ),
    const AuctionItem(
      image: 'assets/images/slider3.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.scheuled,
    ),
    const AuctionItem(
      image: 'assets/images/product.jpeg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.scheuled,
    ),
    const AuctionItem(
      image: 'assets/images/slider1.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.scheuled,
    ),
    const AuctionItem(
      image: 'assets/images/slider2.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.scheuled,
    ),
    const AuctionItem(
      image: 'assets/images/slider3.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.scheuled,
    ),
    const AuctionItem(
      image: 'assets/images/product.jpeg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.scheuled,
    ),
    const AuctionItem(
      image: 'assets/images/slider1.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.scheuled,
    ),
    const AuctionItem(
      image: 'assets/images/slider2.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.scheuled,
    ),
    const AuctionItem(
      image: 'assets/images/slider3.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.scheuled,
    ),
    const AuctionItem(
      image: 'assets/images/product.jpeg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.scheuled,
    ),
    const AuctionItem(
      image: 'assets/images/slider1.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.scheuled,
    ),
    const AuctionItem(
      image: 'assets/images/slider2.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.scheuled,
    ),
    const AuctionItem(
      image: 'assets/images/slider3.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.scheuled,
    ),
  ];
  static List<AuctionItem> kDummyUpcomingAuctionItems = [
    const AuctionItem(
      image: 'assets/images/product.jpeg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.soon,
    ),
    const AuctionItem(
      image: 'assets/images/slider1.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.soon,
    ),
    const AuctionItem(
      image: 'assets/images/slider2.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.soon,
    ),
    const AuctionItem(
      image: 'assets/images/slider3.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.soon,
    ),
    const AuctionItem(
      image: 'assets/images/product.jpeg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.soon,
    ),
    const AuctionItem(
      image: 'assets/images/slider1.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.soon,
    ),
    const AuctionItem(
      image: 'assets/images/slider2.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.soon,
    ),
    const AuctionItem(
      image: 'assets/images/slider3.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.soon,
    ),
    const AuctionItem(
      image: 'assets/images/product.jpeg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.soon,
    ),
    const AuctionItem(
      image: 'assets/images/slider1.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.soon,
    ),
    const AuctionItem(
      image: 'assets/images/slider2.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.soon,
    ),
    const AuctionItem(
      image: 'assets/images/slider3.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.soon,
    ),
    const AuctionItem(
      image: 'assets/images/product.jpeg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.soon,
    ),
    const AuctionItem(
      image: 'assets/images/slider1.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.soon,
    ),
    const AuctionItem(
      image: 'assets/images/slider2.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.soon,
    ),
    const AuctionItem(
      image: 'assets/images/slider3.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.soon,
    ),
    const AuctionItem(
      image: 'assets/images/product.jpeg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.soon,
    ),
    const AuctionItem(
      image: 'assets/images/slider1.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.soon,
    ),
    const AuctionItem(
      image: 'assets/images/slider2.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.soon,
    ),
    const AuctionItem(
      image: 'assets/images/slider3.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.soon,
    ),
  ];
  static List<AuctionItem> kDummyAuctionItems = [
    const AuctionItem(
      image: 'assets/images/product.jpeg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.scheuled,
    ),
    const AuctionItem(
      image: 'assets/images/slider1.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.soon,
    ),
    const AuctionItem(
      image: 'assets/images/slider2.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.live,
    ),
    const AuctionItem(
      image: 'assets/images/slider3.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.scheuled,
    ),
    const AuctionItem(
      image: 'assets/images/slider1.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.live,
    ),
    const AuctionItem(
      image: 'assets/images/slider2.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.live,
    ),
    const AuctionItem(
      image: 'assets/images/product.jpeg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.scheuled,
    ),
    const AuctionItem(
      image: 'assets/images/slider1.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.soon,
    ),
    const AuctionItem(
      image: 'assets/images/slider2.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.live,
    ),
    const AuctionItem(
      image: 'assets/images/slider3.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.scheuled,
    ),
    const AuctionItem(
      image: 'assets/images/slider1.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.live,
    ),
    const AuctionItem(
      image: 'assets/images/slider2.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.live,
    ),
    const AuctionItem(
      image: 'assets/images/product.jpeg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.scheuled,
    ),
    const AuctionItem(
      image: 'assets/images/slider1.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.soon,
    ),
    const AuctionItem(
      image: 'assets/images/slider2.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.live,
    ),
    const AuctionItem(
      image: 'assets/images/slider3.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.scheuled,
    ),
    const AuctionItem(
      image: 'assets/images/slider1.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.live,
    ),
    const AuctionItem(
      image: 'assets/images/slider2.jpg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.live,
    ),
  ];
  static List<Bidder> kDummyTopFiveBidders = [
    Bidder(
        name: 'Bidder Name',
        price: '1080',
        date: DateTime.now(),
        image: 'assets/images/profile_pic.jpg'),
    Bidder(
        name: 'Bidder Name',
        price: '1080',
        date: DateTime.now(),
        image: 'assets/images/profile_pic.jpg'),
    Bidder(
        name: 'Bidder Name',
        price: '1080',
        date: DateTime.now(),
        image: 'assets/images/profile_pic.jpg'),
    Bidder(
        name: 'Bidder Name',
        price: '1080',
        date: DateTime.now(),
        image: 'assets/images/profile_pic.jpg'),
    Bidder(
        name: 'Bidder Name',
        price: '1080',
        date: DateTime.now(),
        image: 'assets/images/profile_pic.jpg'),
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

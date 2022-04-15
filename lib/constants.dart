import 'package:flutter/material.dart';
import 'package:mazzad/components/auction_item.dart';

import 'components/category_button.dart';
import 'models/bidder.dart';
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

//DUMMY DATA
  static const List<String> kDummyImgs = [
    'assets/images/home.jpg',
    'assets/images/product.jpeg',
    'assets/images/product1.png',
  ];
  static List<CategoryButton> kDummyCategories = [
    CategoryButton(
      color: Colors.amber,
      icon: Icons.category,
      onPress: () {},
      name: 'All',
    ),
    CategoryButton(
      color: Colors.pinkAccent,
      icon: Icons.ac_unit,
      onPress: () {},
      name: 'Snow',
    ),
    CategoryButton(
      color: Colors.purpleAccent,
      icon: Icons.chair,
      onPress: () {},
      name: 'Furniture',
    ),
    CategoryButton(
      color: Colors.orange,
      icon: Icons.laptop,
      onPress: () {},
      name: 'Technology',
    ),
    CategoryButton(
      color: Colors.blueAccent,
      icon: Icons.book,
      onPress: () {},
      name: 'Books',
    ),
    CategoryButton(
      color: Colors.amber,
      icon: Icons.category,
      onPress: () {},
      name: 'All',
    ),
    CategoryButton(
      color: Colors.pinkAccent,
      icon: Icons.ac_unit,
      onPress: () {},
      name: 'Snow',
    ),
    CategoryButton(
      color: Colors.purpleAccent,
      icon: Icons.chair,
      onPress: () {},
      name: 'Furniture',
    ),
    CategoryButton(
      color: Colors.orange,
      icon: Icons.laptop,
      onPress: () {},
      name: 'Technology',
    ),
    CategoryButton(
      color: Colors.blueAccent,
      icon: Icons.book,
      onPress: () {},
      name: 'Books',
    ),
    CategoryButton(
      color: Colors.amber,
      icon: Icons.category,
      onPress: () {},
      name: 'All',
    ),
    CategoryButton(
      color: Colors.pinkAccent,
      icon: Icons.ac_unit,
      onPress: () {},
      name: 'Snow',
    ),
    CategoryButton(
      color: Colors.purpleAccent,
      icon: Icons.chair,
      onPress: () {},
      name: 'Furniture',
    ),
    CategoryButton(
      color: Colors.orange,
      icon: Icons.laptop,
      onPress: () {},
      name: 'Technology',
    ),
    CategoryButton(
      color: Colors.blueAccent,
      icon: Icons.book,
      onPress: () {},
      name: 'Books',
    ),
    CategoryButton(
      color: Colors.amber,
      icon: Icons.category,
      onPress: () {},
      name: 'All',
    ),
    CategoryButton(
      color: Colors.pinkAccent,
      icon: Icons.ac_unit,
      onPress: () {},
      name: 'Snow',
    ),
    CategoryButton(
      color: Colors.purpleAccent,
      icon: Icons.chair,
      onPress: () {},
      name: 'Furniture',
    ),
    CategoryButton(
      color: Colors.orange,
      icon: Icons.laptop,
      onPress: () {},
      name: 'Technology',
    ),
    CategoryButton(
      color: Colors.blueAccent,
      icon: Icons.book,
      onPress: () {},
      name: 'Books',
    ),
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
    Bidder(name: 'Malia Renault', price: '1080'),
    Bidder(name: 'Malia Renault', price: '1080'),
    Bidder(name: 'Malia Renault', price: '1080'),
    Bidder(name: 'Malia Renault', price: '1080'),
    Bidder(name: 'Malia Renault', price: '1080'),
    Bidder(name: 'Malia Renault', price: '1080'),
    Bidder(name: 'Malia Renault', price: '1080'),
    Bidder(name: 'Malia Renault', price: '1080'),
    Bidder(name: 'Malia Renault', price: '1080'),
    Bidder(name: 'Malia Renault', price: '1080'),
    Bidder(name: 'Malia Renault', price: '1080'),
    Bidder(name: 'Malia Renault', price: '1080'),
    Bidder(name: 'Malia Renault', price: '1080'),
    Bidder(name: 'Malia Renault', price: '1080'),
    Bidder(name: 'Malia Renault', price: '1080'),
    Bidder(name: 'Malia Renault', price: '1080'),
  ];
}

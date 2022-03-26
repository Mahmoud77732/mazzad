import 'package:flutter/material.dart';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mazzad/screens/auctions/auctions.dart';
import 'package:mazzad/screens/profile/profile_screen.dart';
// import 'package:mazzad/screens/shop/shop_screen.dart';

import '../Shop/shop_screen.dart';
import './/components/category_button.dart';
import './/components/auction_item.dart';
import '../../components/search_textfield.dart';
import './/constants.dart';
import './/size_config.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _bottomNavIndex = 0;
  List<IconData> navIcons = [
    Icons.home,
    Icons.speaker,
    Icons.shopping_cart,
    Icons.person,
  ];
  List<Widget> navPages = [
    Body(),
    AuctionsScreen(),
    ShopScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBody: true,
      body: navPages[_bottomNavIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Colors.white,
        icons: navIcons,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        gapLocation: GapLocation.center,
        activeIndex: _bottomNavIndex,
        activeColor: Constants.kPrimaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Constants.kPrimaryColor,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

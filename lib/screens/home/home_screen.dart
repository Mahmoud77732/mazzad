import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mazzad/constants.dart';
import 'package:mazzad/size_config.dart';

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
    Icons.shop,
    Icons.mic,
    Icons.person,
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: Colors.black,
              size: getProportionateScreenHeight(30),
            ),
          ),
          CircleAvatar(
            radius: getProportionateScreenHeight(15),
          ),
          SizedBox(
            width: Constants.kHorizontalSpacing,
          ),
        ],
        centerTitle: false,
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontSize: getProportionateScreenHeight(24),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Constants.kPrimaryColor.withOpacity(0.8),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      //   gapLocation: GapLocation.center,
      //   icons: [
      //     Icons.home,
      //     Icons.home,
      //     Icons.shop,
      //   ],
      //   notchSmoothness: NotchSmoothness.verySmoothEdge,
      //   leftCornerRadius: 32,
      //   // rightCornerRadius: 32,
      //   onTap: (index) {
      //     setState(() {
      //       _bottomNavIndex = index;
      //     });
      //   },
      //   activeIndex: _bottomNavIndex,
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // // floatingActionButton: FloatingActionButton(
      // //   onPressed: () {},
      // //   child: Icon(Icons.add),
      // // ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

import './/components/category_button.dart';
import './/components/auction_item.dart';
import './/components/custom_textfield.dart';
import './/constants.dart';
import './/size_config.dart';

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
            backgroundImage: const AssetImage(
              'assets/images/profile_pic.jpg',
            ),
          ),
          const SizedBox(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Constants.kHorizontalSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(),
              const SizedBox(
                height: 30,
              ),
              CarouselSlider(
                items: List.generate(
                  3,
                  (index) => InkWell(
                    onTap: () {},
                    child: Image.asset('assets/images/splash_1.png'),
                  ),
                ),
                options: CarouselOptions(
                  height: SizeConfig.screenHeight * 0.6 * 0.45,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  onPageChanged: (i, reason) {
                    print(i);
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(18),
                    ),
                  ),
                  GestureDetector(
                    child: const Text(
                      'see all',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: getProportionateScreenHeight(90),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    10,
                    (_) {
                      return CategoryButton(
                        color: Colors.amber,
                        icon: Icons.category,
                        onPress: () {},
                        name: 'All',
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Recently Auctions Added',
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(18),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 175,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    10,
                    (index) => const AuctionItem(
                      image: 'assets/images/splash_1.png',
                      name: 'Best controller ever',
                      currentBid: 500,
                      status: Status.soon,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(90),
              ),
            ],
          ),
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

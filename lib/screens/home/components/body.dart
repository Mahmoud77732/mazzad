import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazzad/components/search_textfield.dart';
import 'package:mazzad/screens/categories/categories_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Constants.kSmallVerticalSpacing,
              const SearchTextField(),
              Constants.kBigVertcialSpacing,
              CarouselSlider(
                items: List.generate(
                  3,
                  (index) => InkWell(
                    onTap: () {},
                    child: Image.asset('assets/images/product.jpeg'),
                  ),
                ),
                options: CarouselOptions(
                  height: SizeConfig.screenHeight * 0.6 * 0.45,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  onPageChanged: (i, reason) {
                    // print(i);
                  },
                ),
              ),
              Constants.kBigVertcialSpacing,
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
                    onTap: () {
                      Get.toNamed(CategoriesScreen.routeName);
                    },
                  ),
                ],
              ),
              Constants.kSmallVerticalSpacing,
              SizedBox(
                height: getProportionateScreenHeight(90),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      Constants.kDummyCategories[index],
                  itemCount: Constants.kDummyCategories.length,
                  separatorBuilder: (context, index) =>
                      Constants.kSmallHorizontalSpacing,
                ),
              ),
              Constants.kBigVertcialSpacing,
              Text(
                'Recently Auctions Added',
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(18),
                ),
              ),
              Constants.kSmallVerticalSpacing,
              SizedBox(
                height: 175,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(Constants.kDummyAuctionItems.length,
                      (index) => Constants.kDummyAuctionItems[index]),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(90),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazzad/components/default_button.dart';
import 'package:mazzad/constants.dart';
import 'package:mazzad/models/bidder.dart';
import 'package:mazzad/screens/Bidders/main_bidders.dart';
import 'package:mazzad/screens/auction details/components/bidders_carousal_slider.dart';
import 'package:mazzad/screens/auction details/components/products_carousal_slider.dart';
import 'package:mazzad/screens/auction details/components/product_info.dart';
import 'package:mazzad/screens/auction%20details/auction_details_screen.dart';

import '../../../components/auction_item.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BodyState();
  }
}

class BodyState extends State<Body> {
  final String? name;
  final Status? status;
  final String? productName;
  final String? productDescription;
  final String? topFiveBidders;
  final String? image;
  final List<Bidder>? bidders;

  BodyState(
      {this.name,
      this.status,
      this.productName,
      this.productDescription,
      this.topFiveBidders,
      this.image,
      this.bidders});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ProductsCarousalSlider(),
          Constants.kSmallVerticalSpacing,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Constants.kHorizontalSpacing,
            ),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      'creator',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'status',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(
                              image ?? 'assets/images/profile_pic.jpg'),
                        ),
                        Constants.kSmallHorizontalSpacing,
                        Text(
                          name ?? 'bidder.name',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    AuctionStatus(
                      status: status ?? Status.live,
                    ),
                  ],
                ),
                Constants.kSmallVerticalSpacing,
                ProductInfo(
                  description: productDescription,
                  name: productName,
                ),
                Constants.kBigVertcialSpacing,
              ],
            ),
          ),
          TopFiveBiddersCarousalSlider(
            bidders: Constants.kDummyTopFiveBidders,
          ),
          Constants.kBigVertcialSpacing,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Constants.kHorizontalSpacing,
            ),
            child: DefaultButton(
              onPressed: () {
                Get.toNamed(MainBidders.routeName);
              },
              text: 'Place Bid',
            ),
          ),
          Constants.kSmallVerticalSpacing,
        ],
      ),
    );
  }
}

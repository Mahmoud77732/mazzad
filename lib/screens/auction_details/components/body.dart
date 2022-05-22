import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazzad/controller/details_controller.dart';

import '../../../components/auction_status.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../controller/auction_controller.dart';
import '../../../screens/auction_details/components/bidders_carousal_slider.dart';
import '../../../screens/auction_details/components/product_info.dart';
import '../../../screens/auction_details/components/products_carousal_slider.dart';
import '../../Bidders/main_bidders.dart';

class Body extends StatelessWidget {
  DetailsController detailsController = Get.find<DetailsController>();
  @override
  Widget build(BuildContext context) {
    Timer timer = Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        print(
            'this is the auction id::::${detailsController.argumentsValues!['id']}');
        AuctionController.recordUserBehavior(
            auctionId: detailsController.argumentsValues!['id'],
            action: "view");
      },
    );
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
                      children: const [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(
                            'assets/images/profile_pic.png',
                          ),
                        ),
                        Constants.kSmallHorizontalSpacing,
                        Text(
                          'bidder.name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    AuctionStatus(
                      status: detailsController.argumentsValues!['status'],
                      endDate: detailsController.argumentsValues!['date_time'],
                    ),
                  ],
                ),
                Constants.kSmallVerticalSpacing,
                ProductInfo(
                  description:
                      detailsController.argumentsValues!['description'],
                  name: detailsController.argumentsValues!['name'],
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
                timer.cancel();
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

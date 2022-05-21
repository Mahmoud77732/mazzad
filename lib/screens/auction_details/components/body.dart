import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazzad/controller/details_controller.dart';

import '../../../components/auction_item.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../models/bidder/bidder.dart';
import '../../../screens/auction_details/components/bidders_carousal_slider.dart';
import '../../../screens/auction_details/components/product_info.dart';
import '../../../screens/auction_details/components/products_carousal_slider.dart';
import '../../Bidders/main_bidders.dart';

class Body extends StatelessWidget {
  final String? name;
  final Status? status;
  final String? productName;
  final String? productDescription;
  final double? currentBid;
  final String? topFiveBidders;
  final String? image;
  final List<Bidder>? bidders;

  Body({
    this.name,
    this.status,
    this.productName,
    this.productDescription,
    this.currentBid,
    this.topFiveBidders,
    this.image,
    this.bidders,
  });
  @override
  Widget build(BuildContext context) {
    DetailsController detailsController = Get.find<DetailsController>();
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
                            image ?? 'assets/images/profile_pic.png',
                          ),
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
                      // status: status ?? Status.live,
                      status: status ?? detailsController.argumentsValues!['status'],
                    ),
                  ],
                ),
                Constants.kSmallVerticalSpacing,
                ProductInfo(
                  // description: productDescription,
                  // name: productName,
                  description: detailsController.argumentsValues!['description'],
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

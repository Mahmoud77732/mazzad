import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazzad/controller/details_controller.dart';

import '../../../components/auction_item.dart';
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
    AuctionController.recordUserBehavior(
        auctionId: detailsController.argumentsValues!['id'], action: "view");
    return ListView(
      children: <Widget>[
        ProductsCarousalSlider(),
        Constants.kSmallVerticalSpacing,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.kHorizontalSpacing,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                description: detailsController.argumentsValues!['description'],
                name: detailsController.argumentsValues!['name'],
              ),
              Constants.kBigVertcialSpacing,
              TopFiveBiddersCarousalSlider(
                bidders: Constants.kDummyTopFiveBidders,
              ),
              Constants.kBigVertcialSpacing,
              const Text(
                'Similar Auctions',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 160,
                child: GetBuilder<AuctionController>(
                  init: AuctionController(),
                  builder: (controller) {
                    return FutureBuilder(
                      future: controller.getSimilarAuctions(
                          auctionId: detailsController.argumentsValues!['id']),
                      builder: ((context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.active:
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                            return const Center(
                                child: CircularProgressIndicator());
                          case ConnectionState.done:
                            return ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: ((context, index) {
                                AuctionItem similarItem =
                                    controller.similarAuctions[index];
                                return similarItem;
                              }),
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.similarAuctionsLength.value,
                            );
                        }
                      }),
                    );
                  },
                ),
              ),
              Constants.kBigVertcialSpacing,
              DefaultButton(
                onPressed: () {
                  // timer.cancel();
                  Get.toNamed(MainBidders.routeName);
                },
                text: 'Place Bid',
              ),
              Constants.kSmallVerticalSpacing,
            ],
          ),
        ),
      ],
    );
  }
}

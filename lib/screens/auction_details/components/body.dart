import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:mazzad/controller/details_controller.dart';

import '../../../components/auction_item.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../screens/auction_details/components/bidders_carousal_slider.dart';
import '../../../screens/auction_details/components/product_info.dart';
import '../../../screens/auction_details/components/products_carousal_slider.dart';
import '../../../size_config.dart';
import '../../Bidders/main_bidders.dart';

class Body extends StatelessWidget {
  DetailsController detailsController = Get.find<DetailsController>();
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
                    DetailsAuctionStatus(
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

class DetailsAuctionStatus extends StatelessWidget {
  const DetailsAuctionStatus({
    Key? key,
    required this.status,
    this.endDate,
  }) : super(key: key);
  final Status status;
  final DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: status == Status.live
            ? Colors.red.withOpacity(0.2)
            : status == Status.scheduled
                ? Colors.green.withOpacity(0.2)
                : Constants.kPrimaryColor.withOpacity(0.2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          status == Status.live
              ? const CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.red,
                )
              : const SizedBox(),
          status == Status.live
              ? SizedBox(
                  width: getProportionateScreenWidth(5),
                )
              : const SizedBox(),
          status == Status.scheduled
              ? CountdownTimer(
                  endTime: endDate!.millisecondsSinceEpoch + 1000 * 30,
                  widgetBuilder: (_, CurrentRemainingTime? time) {
                    if (time == null) {
                      return const Text('Game over');
                    }
                    return Text(
                      '${time.days}d ${time.hours}h ${time.min}m',
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                )
              : const SizedBox(),
          status == Status.live
              ? Text(
                  'Live',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: getProportionateScreenHeight(14),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

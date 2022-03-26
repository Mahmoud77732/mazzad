import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazzad/screens/auction%20details/auction_details_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class AuctionItem extends StatelessWidget {
  const AuctionItem({
    Key? key,
    required this.name,
    required this.image,
    required this.currentBid,
    required this.status,
  }) : super(key: key);
  final String image;
  final String name;
  final double currentBid;
  final Status status;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        Get.toNamed(AuctionDetailsScreen.routeName);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 10,
              child: Center(
                child: Image.asset(
                  image,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Expanded(
              flex: 17,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  //status == Status.live ?
                  AuctionStatus(
                    status: status,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenHeight(14),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    'Current Bid',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: getProportionateScreenHeight(14),
                    ),
                  ),
                  Text(
                    '${currentBid.toStringAsFixed(0)} \$',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: getProportionateScreenHeight(14),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        margin: const EdgeInsets.all(5),
        height: 170,
        width: 155,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              blurRadius: 2,
              spreadRadius: 1,
              // offset: Offset(1, 1),
            ),
          ],
        ),
      ),
    );
  }
}

enum Status { live, scheuled, soon }

class AuctionStatus extends StatelessWidget {
  const AuctionStatus({
    Key? key,
    required this.status,
  }) : super(key: key);
  final Status status;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: status == Status.live
            ? Colors.red.withOpacity(0.2)
            : status == Status.scheuled
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
          Text(
            status == Status.live
                ? 'Live'
                : status == Status.scheuled
                    ? "12h : 32m : 12s"
                    : "Soon",
            style: TextStyle(
              color: status == Status.live
                  ? Colors.red
                  : status == Status.scheuled
                      ? Colors.green
                      : Constants.kPrimaryColor,
              fontSize: getProportionateScreenHeight(14),
            ),
          ),
        ],
      ),
    );
  }
}

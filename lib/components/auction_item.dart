import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazzad/controller/details_controller.dart';
import 'package:mazzad/screens/auction_details/auction_details_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class AuctionItem extends StatefulWidget {
  const AuctionItem({
    Key? key,
    required this.name,
    this.description,
    required this.image,
    required this.currentBid,
    required this.status,
  }) : super(key: key);

  final List<String> image;
  final String name;
  final String? description;
  final double currentBid;
  final Status status;

  @override
  State<AuctionItem> createState() => _AuctionItemState();
}

class _AuctionItemState extends State<AuctionItem> {
  Map<String, dynamic>? argumentsValues;

  @override
  void initState() {
    argumentsValues = {
      'name': widget.name,
      'description': widget.description,
      'image': widget.image,
      'current_bid': widget.currentBid,
      'status': widget.status,
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<DetailsController>().argumentsValues = argumentsValues;
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
                child: Image.network(
                  widget.image[0],
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
                    status: widget.status,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenHeight(14),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.clip,
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
                    '${widget.currentBid.toStringAsFixed(0)} \$',
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

enum Status { live, scheduled, soon }

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
          Text(
            status == Status.live
                ? 'Live'
                : status == Status.scheduled
                    ? "12h : 32m : 12s"
                    : "Soon",
            style: TextStyle(
              color: status == Status.live
                  ? Colors.red
                  : status == Status.scheduled
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

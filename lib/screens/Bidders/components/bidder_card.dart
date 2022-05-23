import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class BidderCard extends StatefulWidget {
  const BidderCard({Key? key, required this.auction_id}) : super(key: key);
  final int? auction_id;
  @override
  State<StatefulWidget> createState() {
    return BidderCardState();
  }
}

class BidderCardState extends State<BidderCard> {
  @override
  Widget build(BuildContext context) {
    // Timer timer = Timer.periodic(
    //   const Duration(seconds: 3),
    //   (timer) {
    //     print('this is the auction id::::${widget.auction_id}');
    //     AuctionController.recordUserBehavior(
    //         auctionId: widget.auction_id!, action: "attempt_to_bid");
    //   },
    // );
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5),
              child: Card(
                elevation: 4,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 23,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(
                        Constants.kDummyBiddersList[index].image ??
                            "assets/images/profile_pic.png"),
                  ),
                  title: Text(
                    Constants.kDummyBiddersList[index].name ?? "unkwon",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  trailing: Text(
                    '\$${Constants.kDummyBiddersList[index].price ?? 0.0}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            itemCount: Constants.kDummyBiddersList.length,
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(53 + 80),
        )
      ],
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mazzad/constants.dart';
import 'package:mazzad/models/bidder.dart';

class BidderCard extends StatefulWidget {
  const BidderCard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BidderCardState();
  }
}

//TODO: maybe put it inside a refresh indicator for refreshing the page to gert the new highly pidders every time

class BidderCardState extends State<BidderCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
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
                      "assets/images/profile_pic.jpg"),
            ),
            title: Text(
              Constants.kDummyBiddersList[index].name ?? "unkwon",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            trailing: Text(
              '\$${Constants.kDummyBiddersList[index].price ?? 0.0}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
      itemCount: Constants.kDummyBiddersList.length,
    );
  }
}

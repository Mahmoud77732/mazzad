// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mazzad/constants.dart';
import 'package:mazzad/screens/auction details/components/bidders_carousal_slider.dart';
import 'package:mazzad/screens/auction details/components/products_carousal_slider.dart';
import 'package:mazzad/screens/auction details/components/product_info.dart';

import '../../../components/auction_item.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BodyState();
  }
}

class BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: Constants.kHorizontalSpacing,
        ),
        child: Column(
          children: <Widget>[
            ProductsCarousalSlider(),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'creator',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                Text('status',
                    style: TextStyle(color: Colors.grey, fontSize: 15)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 23,
                      backgroundColor: Colors.transparent,
                      child: Image.asset('assets/images/comvzhssmyverizon.png'),
                    ),
                    Text(
                      'bidder.name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                AuctionStatus(
                  status: Status.live,
                ),
              ],
            ),
            Column(
              children: [],
            ),
            SizedBox(height: 10),
            ProductInfo(),
            BiddersCarousalSlider(),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mazzad/screens/Bidders/components/bidder_card.dart';
import 'package:mazzad/screens/Bidders/components/bottom_form.dart';

class MainBidders extends StatefulWidget {
  const MainBidders({Key? key}) : super(key: key);
  static const routeName = '/main_bidders';
  @override
  State<StatefulWidget> createState() {
    return MainBiddersState();
  }
}

class MainBiddersState extends State<MainBidders> {
  bool showForm = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bidders',
            style: TextStyle(color: Colors.black, fontSize: 25)),
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: BidderCard(),
      bottomSheet: BottomForm(),
    );
  }
}

import 'package:flutter/material.dart';

import './components/bidder_card.dart';
import './components/bottom_form.dart';

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
        title: const Text(
          'Bidders',
        ),
      ),
      body: const BidderCard(),
      bottomSheet: const BottomForm(),
    );
  }
}

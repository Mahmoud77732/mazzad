import 'package:flutter/material.dart';

import '../../screens/auctions/components/body.dart';

class AuctionsScreen extends StatelessWidget {
  const AuctionsScreen({Key? key}) : super(key: key);
  static const String routeName = './auctions';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Auctions',
        ),
      ),
      body: const Body(),
    );
  }
}

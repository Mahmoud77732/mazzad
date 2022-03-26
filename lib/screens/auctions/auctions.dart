import 'package:flutter/material.dart';
import 'package:mazzad/screens/auctions/components/body.dart';

class AuctionsScreen extends StatelessWidget {
  const AuctionsScreen({Key? key}) : super(key: key);
  static const String routeName = './auctions';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Auctions',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Body(),
    );
  }
}

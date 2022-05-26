import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auctions_by_category_controller.dart';
import 'components/body.dart';

class AuctionsByCategoryScreen extends StatelessWidget {
  const AuctionsByCategoryScreen({Key? key}) : super(key: key);
  static const String routeName = './auctions_by_category';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Get.find<AuctionsByCategoryController>().categoryName.value,
        ),
      ),
      body: const Body(),
    );
  }
}

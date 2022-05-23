import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mazzad/controller/home_controller.dart';

import '../../constants.dart';
import '../../size_config.dart';

class ShopScreen extends StatelessWidget {
  static const routeName = '/shop_screen';
  final ctrl = Get.put<HomeController>(HomeController());

  ShopScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ctrl.getSlider();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shop',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Constants.kHorizontalSpacing),
        child: Column(
          children: [
            const Spacer(),
            const Expanded(
              flex: 1,
              child: Text(
                'Coming Soon',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: SvgPicture.asset('assets/icons/shop.svg',
                  height: SizeConfig.screenHeight * 0.43),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

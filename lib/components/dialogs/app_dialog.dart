import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../constants.dart';

class AppDialog {
  static void showCheckMarkDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Dialog(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Constants.kHorizontalSpacing),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Constants.kBigVertcialSpacing,
                  Lottie.asset('assets/lotties/changes_check.json',
                      height: 200),
                ],
              ),
            ),
          ),
        );
      },
    ).timeout(
        const Duration(
          milliseconds: 3000,
        ), onTimeout: () {
      Get.back();
      Get.back();
    });
  }

  static void showContactUsDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Dialog(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Constants.kHorizontalSpacing),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Constants.kBigVertcialSpacing,
                    Lottie.asset('assets/lotties/contact_us_send.json',
                        height: 200),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ).timeout(
        const Duration(
          milliseconds: 3000,
        ), onTimeout: () {
      Get.back();
      Get.back();
    });
  }

  static void showAuctionPlacedDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Dialog(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(Constants.kHorizontalSpacing),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      Constants.kBigVertcialSpacing,
                      Lottie.asset('assets/lotties/auction_placed.json',
                          height: 200),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ).timeout(
        const Duration(
          milliseconds: 3000,
        ), onTimeout: () {
      Get.back();
      Get.back();
    });
  }
}

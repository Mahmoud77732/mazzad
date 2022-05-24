import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../constants.dart';

class AppDialog {
  static void showCheckMarkDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Dialog(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Constants.kHorizontalSpacing),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
}

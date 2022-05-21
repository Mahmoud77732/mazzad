import 'package:get/get.dart';

import '../components/auction_item.dart';

class DetailsController extends GetxController {
  // DetailsController({
  //   required this.name,
  //   this.description,
  //   required this.image,
  //   required this.currentBid,
  //   required this.status,
  // });

  // final List<String> image;
  // final String name;
  // final String? description;
  // final double currentBid;
  // final Status status;
  
  Map<String, dynamic>? argumentsValues;

  @override
  void onInit() {
    print('---> details controller');
    super.onInit();
  }
  
}

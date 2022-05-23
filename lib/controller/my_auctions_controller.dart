import 'package:get/get.dart';

class MyAuctionsController extends GetxController {
  int? userId = 1;
  String? userName = '';

  void updateUserId(int id) {
    userId = id;
    update();
  }

  void updateUserName(String name) {
    userName = name;
    update();
  }

  @override
  void onInit() {
    print('---> AuctionsByCategoryController');
    super.onInit();
  }
}

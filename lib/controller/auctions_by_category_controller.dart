import 'package:get/get.dart';

class AuctionsByCategoryController extends GetxController {
  var categoryName = ''.obs;
  int? categoryId = 1;

  void updateCategoryId(int id) {
    categoryId = id;
    update();
  }

  @override
  void onInit() {
    print('---> AuctionsByCategoryController');
    super.onInit();
  }
}

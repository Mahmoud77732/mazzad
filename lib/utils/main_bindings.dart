import 'package:get/get.dart';
import 'package:mazzad/controllers/layout_controller.dart';
import 'package:mazzad/controllers/login_controller.dart';
import 'package:mazzad/controllers/register_controller.dart';
import 'package:mazzad/shared/network/remote/dio_helper.dart';
// import 'package:mazzad/view/register/controllers/shop_register_controller.dart';
// import 'package:mazzad/view/search/controllers/search_controller.dart';

class MainBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LayoutController()..getFavorites()
                                            ..getGategories()
                                            ..getHomeData()
                                            ..getUserData(), fenix: true);
    Get.lazyPut(() => RegisterController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
    // Get.lazyPut(() => SearchController(), fenix: true);
    // Get.put(() => DioHelper(), permanent: true);
  }
}

import 'package:get/get.dart';
import 'package:mazzad/models/slider/slider_model.dart';
import 'package:mazzad/services/home_page_service.dart';

class HomeController extends GetxController {
  List<SliderModel>? _slider = [];
  List<SliderModel>? get slider => _slider;
  int get length => _slider!.length;
  HomeController() {
    getSlider();
  }
  Future<bool?> getSlider() async {
    await HomePageService.getSlider().then((value) => _slider = value);
    return true;
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mazzad/constants.dart';
import 'package:mazzad/models/slider/slider_model.dart';

class HomePageService {
  static Future<List<SliderModel>?> getSlider() async {
    try {
      final response = await http.get(
        Uri.parse('${Constants.api}/slider'),
      );
      if (response.statusCode == 200) {
        final mySliders = jsonDecode(response.body);
        return (mySliders['data'] as Iterable)
            .map((e) => SliderModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      print(e);
      rethrow;
    }
    return null;
  }
}

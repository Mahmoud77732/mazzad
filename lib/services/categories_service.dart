import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mazzad/models/categories/categories.dart';

import '../constants.dart';

class CategoriesService {
  // static const _base = '';
  static Future<List<Categories>> getAllCategories() async {
    List<Categories> myCategories = [];
    try {
      final response = await http.get(
        Uri.parse(
          '${Constants.api}/category/',
        ),
        headers: await Constants.headers,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final resBody = jsonDecode(response.body)["data"];
        if (resBody != null) {
          myCategories =
              (resBody as Iterable).map((e) => Categories.fromJson(e)).toList();
        } else {
          print('the resBody in getAllCategories endpoint is Empty');
        }
      }
    } catch (e) {
      print(e);
    }
    print(myCategories);
    return myCategories;
  }
}

// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mazzad/constants.dart';
import 'package:mazzad/models/auction/auction.dart';
import 'package:mazzad/models/search_model.dart';

class SearchController extends GetxController {
  SearchModel? searchModel;

  Future<void> search(String text) async {
    try {
      final response = await http.get(
        Uri.parse(
          // {{BASE_URL}}/auction/search?search=samsung
          '${Constants.api}/auction/search?search=$text',
        ),
        headers: await Constants.headers,
      );
      final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
      print('---> responseMap: $responseMap');
      print('---> responseMap[\'data\']: ${responseMap['data']}');
      searchModel = SearchModel.fromJson(responseMap);
      // searchModel = SearchModel.fromJson(responseMap['data']);
      print('---> response.body: ${response.body}');
      update();
    } catch (error) {
      print('---> ERROR.SearchController.search(): $error');
    }
  }
}

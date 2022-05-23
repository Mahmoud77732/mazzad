// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mazzad/constants.dart';
import 'package:mazzad/models/profile/profile.dart';
import 'package:mazzad/services/profile_service.dart';

class LayoutController extends GetxController {
  Profile? userModel;

  Map<int, bool>? favorites = {};

  LayoutController() {
    getUserData();
  }

  Future<void> getUserData() async {
    try {
      final response = await http.get(
        Uri.parse(
          '${Constants.api}/me/',
        ),
        headers: await Constants.headers,
      );
      final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
      userModel = Profile.fromJson(responseMap['data']);
      print('---> LayoutController.userModel: $userModel');
      update();
    } catch (error) {
      print('--> Error.LayoutController.getuserData()__ $error __');
    }
  }

  Future<bool?>? updateUserData({Profile? profile}) async {
    return await ProfileService.updateUserData(profile: profile);
  }
}

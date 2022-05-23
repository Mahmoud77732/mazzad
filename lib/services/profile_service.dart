import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../models/profile/profile.dart';

class ProfileService {
  static Future<Profile> getProfileData() async {
    try {
      final response = await http.get(Uri.parse('${Constants.api}/me'),
          headers: await Constants.profileHeader);

      if (response.statusCode == 200) {
        final decodedProfileData = json.decode(response.body);
        return Profile.fromJson(decodedProfileData['data']);
      } else {
        throw response.statusCode;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  static Future<bool>? updateUserData({Profile? profile}) async {
    try {
      final myStaticJson = {
        "id": profile!.id.toString(),
        "email": profile.email,
        "name": profile.name,
        "phone_number": profile.phone_number
      };
      final response = await http.post(
          Uri.parse('${Constants.api}/me/updateProfile'),
          body: myStaticJson,
          headers: await Constants.profileHeader);
      if (kDebugMode) {
        print(response.body);
      }
      if (response.statusCode == 200) {
        return true;
      } else {
        print('there is an err in updating user data');
        return false;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

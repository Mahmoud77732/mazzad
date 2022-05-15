import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mazzad/constants.dart';

import '../models/profile/profile.dart';

class ProfileService {
  static Future<Profile> getProfileData() async {
    try {
      final response = await http.get(Uri.parse('${Constants.api}/me'),
          headers: await Constants.profileHeader);

      final decodedProfileData = json.decode(response.body);
      if (response.statusCode == 200) {
        return Profile.fromJson(decodedProfileData['data']);
      } else {
        throw response.statusCode;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

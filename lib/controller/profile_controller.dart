import 'package:get/get.dart';
import 'package:mazzad/models/profile/profile.dart';
import 'package:mazzad/services/profile_service.dart';

class ProfileController extends GetxController {
  Rx<Profile>? myProfile = const Profile().obs;

  ProfileController() {
    getMyProfile();
  }

  void getMyProfile() async {
    try {
      await ProfileService.getProfileData().then((value) {
        myProfile!.value = value;
      });
      update();
    } catch (e) {
      print(e);
    }
  }
}

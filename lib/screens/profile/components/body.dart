import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './big_clipper.dart';
import '../../../constants.dart';
import '../../../controller/profile_controller.dart';
import '../../../screens/contact_us/contact_us_screen.dart';
import '../../../screens/edit_profile/edit_profile_screen.dart';
import '../../../screens/my_auctions/my_auctions_screen.dart';
import '../../../screens/privacy_and_policy/privacy_and_policy_screen.dart';
import '../../../screens/profile/components/small_clipper.dart';
import '../../../screens/terms_of_use/terms_of_use_screen.dart';
import '../../../size_config.dart';
import '../../login/login_screen.dart';
import '../clip_shadow_path.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<ProfileController>(
          init: ProfileController(),
          builder: (controller) {
            return Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight - 96,
                  width: SizeConfig.screenWidth,
                  child: Stack(
                    children: [
                      ClipShadowPath(
                        shadow: const BoxShadow(
                          color: Color.fromARGB(255, 170, 61, 22),
                          offset: Offset(4, 4),
                          blurRadius: 4,
                          spreadRadius: 4,
                        ),
                        clipper: BigClipper(),
                        child: Container(
                          color: Constants.kPrimaryColor,
                        ),
                      ),
                      ClipShadowPath(
                        shadow: const BoxShadow(
                          color: Color.fromARGB(255, 170, 61, 22),
                          offset: Offset(4, 4),
                          blurRadius: 4,
                          spreadRadius: 4,
                        ),
                        clipper: SmallClipper(),
                        child: Container(
                          color: Constants.kPrimaryColor,
                        ),
                      ),
                      Positioned(
                        right: getProportionateScreenWidth(40),
                        top: getProportionateScreenHeight(180),
                        child: TextButton(
                          child: Row(
                            children: [
                              const Text(
                                'Logout',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(5),
                              ),
                              const Icon(
                                Icons.login,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          onPressed: () {
                            Get.offAllNamed(LoginScreen.routeName);
                          },
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: getProportionateScreenHeight(230),
                        child: TextButton(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.edit_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(5),
                              ),
                              const Text(
                                'Edit Profile',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            // Get.to('/edit_profile');
                            Get.toNamed(EditProfileScreen.routeName);
                          },
                        ),
                      ),
                      Positioned(
                        top: getProportionateScreenHeight(20),
                        left: SizeConfig.screenWidth / 2 - 50,
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: const AssetImage(
                                  'assets/images/profile_pic.jpg'),
                              radius: getProportionateScreenHeight(50),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(15),
                            ),
                            Text(
                              controller.myProfile!.value.name ?? "user",
                              style: TextStyle(
                                fontSize: getProportionateScreenHeight(20),
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        child: SizedBox(
                          height: SizeConfig.screenHeight / 2,
                          child: ListView.separated(
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
                            itemBuilder: (ctx, index) {
                              return profileTiles[index];
                            },
                            separatorBuilder: (ctx, index) {
                              return const Divider(
                                height: 2,
                              );
                            },
                            itemCount: profileTiles.length,
                          ),
                        ),
                        top: getProportionateScreenHeight(300),
                        left: 0,
                        width: SizeConfig.screenWidth,
                      )
                    ],
                  ),
                ),
                //    Container(height: SizeConfig.screenHeight / 4),
              ],
            );
          }),
    );
  }

  static List<ListTile> profileTiles = [
    ListTile(
      title: const Text(
        'Terms of use',
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Get.toNamed(TermsOfUseScreen.routeName);
      },
    ),
    ListTile(
      title: const Text(
        'Privacy policy',
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Get.toNamed(PrivacyAndPolicy.routeName);
      },
    ),
    ListTile(
      title: const Text(
        'Contact us',
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Get.toNamed(ContactUsScreen.routeName);
      },
    ),
    ListTile(
      title: const Text(
        'My auctions',
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Get.toNamed(MyAuctionsScreen.routeName);
      },
    ),
    // ListTile(
    //   title: const Text(
    //     'Change password',
    //     style: TextStyle(
    //       color: Colors.grey,
    //       fontWeight: FontWeight.bold,
    //     ),
    //   ),
    //   trailing: const Icon(Icons.arrow_forward_ios),
    //   onTap: () {},
    // ),
  ];
}

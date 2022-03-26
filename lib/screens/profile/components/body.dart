import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazzad/screens/profile/components/small_clipper.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../login/login_screen.dart';
import '../clip_shadow_path.dart';
import 'big_clipper.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: SizeConfig.screenHeight - 96,
          width: SizeConfig.screenWidth,
          child: Stack(
            children: [
              ClipShadowPath(
                shadow: const BoxShadow(
                  color: Colors.black,
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
                  color: Colors.black,
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
                  onPressed: () {},
                ),
              ),
              Positioned(
                top: getProportionateScreenHeight(20),
                left: SizeConfig.screenWidth / 2 - 50,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/profile_pic.jpg'),
                      radius: getProportionateScreenHeight(50),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    Text(
                      'Malia Renult',
                      style: TextStyle(
                        fontSize: getProportionateScreenHeight(20),
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Expanded(
                    child: Container(),
                    flex: 3,
                  ),
                  Expanded(
                    flex: 4,
                    child: ListView.separated(
                      itemBuilder: (ctx, index) {
                        return ListTile(
                          title: Text(
                            'Terms of use',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {},
                        );
                      },
                      separatorBuilder: (ctx, index) {
                        return const Divider(
                          height: 2,
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

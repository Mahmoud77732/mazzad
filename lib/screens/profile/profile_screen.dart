import 'package:flutter/material.dart';
import 'package:mazzad/constants.dart';
import 'package:mazzad/size_config.dart';

import 'clip_shadow_path.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = 'profile_screen';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView(
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
                    onPressed: () {},
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
      ),
    );
  }
}

class BigClipper extends CustomClipper<Path> {
  @override
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 414;
    final double _yScaling = size.height / 896;
    path.lineTo(
        -0.003999999999997783 * _xScaling, 341.78499999999997 * _yScaling);
    path.cubicTo(
      -0.003999999999997783 * _xScaling,
      341.78499999999997 * _yScaling,
      23.461000000000002 * _xScaling,
      363.15099999999995 * _yScaling,
      71.553 * _xScaling,
      363.15099999999995 * _yScaling,
    );
    path.cubicTo(
      119.645 * _xScaling,
      363.15099999999995 * _yScaling,
      142.21699999999998 * _xScaling,
      300.186 * _yScaling,
      203.29500000000002 * _xScaling,
      307.21 * _yScaling,
    );
    path.cubicTo(
      264.373 * _xScaling,
      314.234 * _yScaling,
      282.666 * _xScaling,
      333.47299999999996 * _yScaling,
      338.408 * _xScaling,
      333.47299999999996 * _yScaling,
    );
    path.cubicTo(
      394.15000000000003 * _xScaling,
      333.47299999999996 * _yScaling,
      413.99600000000004 * _xScaling,
      254.199 * _yScaling,
      413.99600000000004 * _xScaling,
      254.199 * _yScaling,
    );
    path.cubicTo(
      413.99600000000004 * _xScaling,
      254.199 * _yScaling,
      413.99600000000004 * _xScaling,
      0 * _yScaling,
      413.99600000000004 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      413.99600000000004 * _xScaling,
      0 * _yScaling,
      -0.003999999999976467 * _xScaling,
      0 * _yScaling,
      -0.003999999999976467 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      -0.003999999999976467 * _xScaling,
      0 * _yScaling,
      -0.003999999999997783 * _xScaling,
      341.78499999999997 * _yScaling,
      -0.003999999999997783 * _xScaling,
      341.78499999999997 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}

class SmallClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 414;
    final double _yScaling = size.height / 896;
    path.lineTo(-0.003999999999997783 * _xScaling, 217.841 * _yScaling);
    path.cubicTo(
      -0.003999999999997783 * _xScaling,
      217.841 * _yScaling,
      19.14 * _xScaling,
      265.91999999999996 * _yScaling,
      67.233 * _xScaling,
      265.91999999999996 * _yScaling,
    );
    path.cubicTo(
      115.326 * _xScaling,
      265.91999999999996 * _yScaling,
      112.752 * _xScaling,
      234.611 * _yScaling,
      173.83299999999997 * _xScaling,
      241.635 * _yScaling,
    );
    path.cubicTo(
      234.914 * _xScaling,
      248.659 * _yScaling,
      272.866 * _xScaling,
      301.691 * _yScaling,
      328.608 * _xScaling,
      301.691 * _yScaling,
    );
    path.cubicTo(
      384.34999999999997 * _xScaling,
      301.691 * _yScaling,
      413.99600000000004 * _xScaling,
      201.977 * _yScaling,
      413.99600000000004 * _xScaling,
      201.977 * _yScaling,
    );
    path.cubicTo(
      413.99600000000004 * _xScaling,
      201.977 * _yScaling,
      413.99600000000004 * _xScaling,
      0 * _yScaling,
      413.99600000000004 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      413.99600000000004 * _xScaling,
      0 * _yScaling,
      -0.003999999999976467 * _xScaling,
      0 * _yScaling,
      -0.003999999999976467 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      -0.003999999999976467 * _xScaling,
      0 * _yScaling,
      -0.003999999999997783 * _xScaling,
      217.841 * _yScaling,
      -0.003999999999997783 * _xScaling,
      217.841 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}

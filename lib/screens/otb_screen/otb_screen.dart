import 'package:flutter/material.dart';
import 'package:mazzad/size_config.dart';

import './components/body.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);
  static const routeName = '/otp_screen';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("OTP Verification"),
      // ),
      body: Body(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mazzad/components/default_button.dart';
import 'package:mazzad/components/default_text_field.dart';
import 'package:mazzad/constants.dart';
import 'package:mazzad/services/validator.dart';

import '../../size_config.dart';
// importm => flutter material

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);
  static const routeName = '/contact_us_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: Stack(
        children: [
          // make the container with the fixed curves on it
          Container(),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: Constants.kHorizontalSpacing,
            ),
            child: Column(
              children: [
                Constants.kBigVertcialSpacing,
                Lottie.asset('assets/lotties/contact_us.json'),
                Constants.kSmallVerticalSpacing,
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'How can we help you?\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(22),
                        ),
                      ),
                      const TextSpan(
                        text:
                            'It looks like you have problems with our system.\n',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: 'We are here to help you, so, please\n',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: 'get in touch with us\n',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const DefaultTextField(
                    title: 'your email', validate: Validator.validateEmail),
                Constants.kSmallVerticalSpacing,
                const DefaultTextField(
                  title: 'Type your message .. ',
                  isLargeText: true,
                  validate: null,
                ),
                Constants.kSmallVerticalSpacing,
                DefaultButton(
                  text: 'Submit',
                  onPressed: () {
                    //submitting the complain
                  },
                ),
                Constants.kBigVertcialSpacing,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

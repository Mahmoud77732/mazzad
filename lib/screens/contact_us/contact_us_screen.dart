import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
          Column(children: [
            Lottie.asset('assets/lotties/contact_us.json'),
            //   RichText(
            //     textAlign: TextAlign.center,
            //     text: TextSpan(
            //       children: [
            //         TextSpan(
            //           text: 'How can we help you?',
            //           style: TextStyle(
            //             color: Colors.grey,
            //             fontWeight: FontWeight.bold,
            //             fontSize: getProportionateScreenWidth(32),
            //           ),
            //         ),
            //         const TextSpan(
            //           text: 'It looks like you have problems with our system.',
            //           style: TextStyle(
            //             color: Colors.grey,
            //           ),
            //         ),
            //         const TextSpan(
            //           text: 'We are here to help you, so, please',
            //           style: TextStyle(
            //             color: Colors.grey,
            //           ),
            //         ),
            //         const TextSpan(
            //           text: 'get in touch with us',
            //           style: TextStyle(
            //             color: Colors.grey,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ],
          ]),
        ],
      ),
    );
  }
}

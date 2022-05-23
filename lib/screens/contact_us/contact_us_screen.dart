import 'package:flutter/material.dart';

import './components/body.dart';
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
      body: const Body(),
    );
  }
}

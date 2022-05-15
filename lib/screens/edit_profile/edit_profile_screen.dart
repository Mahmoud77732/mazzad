import 'package:flutter/material.dart';

import '../../components/default_button.dart';
import '../../components/default_text_field.dart';
import '../../constants.dart';
import '../../services/validator.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/edit_profile';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.kHorizontalSpacing,
          ),
          children: [
            Constants.kBigVertcialSpacing,
            const DefaultTextField(
              title: 'Change your name',
              validate: Validator.validateName,
            ),
            Constants.kSmallVerticalSpacing,
            // const DefaultTextField(
            //   isLargeText: true,
            //   title: "product description ..",
            // ),
            // Constants.kSmallVerticalSpacing,
            // const DefaultTextField(
            //   title: "start bid price",
            // ),
            // Constants.kSmallVerticalSpacing,
            // const DefaultTextField(),
            Constants.kSmallVerticalSpacing,
            DefaultButton(
              onPressed: () {
                _formKey.currentState!.validate();
              },
              text: 'Place Changes',
            ),
          ],
        ),
      ),
    );
  }
}

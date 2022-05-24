import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/default_button.dart';
import '../../components/default_text_field.dart';
import '../../components/dialogs/check_mark_dialog.dart';
import '../../constants.dart';
import '../../controller/layout_controller.dart';
import '../../controller/text_field_controller.dart';
import '../../models/profile/profile.dart';
import '../../services/validator.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/edit_profile';

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  var _isInit = true;
  var _isLoading = false;
  final LayoutController layoutController = LayoutController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      layoutController.getUserData().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    setState(() {
      _isInit = false;
    });
    //! he wrote only
    // _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
        ),
      ),
      body: (_isLoading)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _formKey,
              child: ListView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.symmetric(
                  horizontal: Constants.kHorizontalSpacing,
                ),
                itemCount: 1,
                itemBuilder: (BuildContext ctx, int index) {
                  var model = layoutController.userModel!;
                  return Column(
                    children: [
                      Constants.kBigVertcialSpacing,
                      DefaultTextField(
                        initialValue: model.name,
                        title: 'Name',
                        validate: Validator.validateName,
                      ),
                      Constants.kSmallVerticalSpacing,
                      DefaultTextField(
                        initialValue: model.email,
                        title: 'Email',
                        validate: Validator.validateEmail,
                      ),
                      Constants.kSmallVerticalSpacing,
                      DefaultTextField(
                        initialValue: model.phone_number,
                        title: 'Phone',
                        validate: Validator.validatePhone,
                      ),
                      Constants.kSmallVerticalSpacing,
                      Constants.kSmallVerticalSpacing,
                      DefaultButton(
                        onPressed: () async {
                          Profile profile = Profile(
                            email: Get.find<TextFieldController>().email,
                            name: Get.find<TextFieldController>().name,
                            phone_number:
                                Get.find<TextFieldController>().phoneNumber,
                            id: model.id,
                          );
                          final bool? check = await layoutController
                              .updateUserData(profile: profile);
                          _formKey.currentState!.validate();
                          print(check);

                          if (check!) {
                            AppDialog.showCheckMarkDialog(
                                context, 'Successfuly Changed');
                            Get.back();
                          } else {
                            print('it does not work');
                          }
                        },
                        text: 'Place Changes',
                      ),
                    ],
                  );
                },
              ),
            ),
    );
  }
}

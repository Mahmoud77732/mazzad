import 'package:flutter/material.dart';
import 'package:mazzad/controller/layout_controller.dart';

import '../../components/default_button.dart';
import '../../components/default_text_field.dart';
import '../../constants.dart';
import '../../services/validator.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key? key}) : super(key: key);
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
                  print('---> EditProfileScreen.model= __ $model __');
                  print(
                      '---> EditProfileScreen.model.email= __ ${model.email} __');
                  print(
                      '---> EditProfileScreen.model.name= __ ${model.name} __');
                  print(
                      '---> EditProfileScreen.model.phone_number= __ ${model.phone_number} __');
                  // nameController.text = model.data!.name!;
                  // emailController.text = model.data!.email!;
                  // phoneController.text = model.data!.phone!;
                  return Column(
                    children: [
                      Constants.kBigVertcialSpacing,
                      const DefaultTextField(
                        title: 'Change your name',
                        validate: Validator.validateName,
                      ),
                      Constants.kSmallVerticalSpacing,
                      const DefaultTextField(
                        // isLargeText: true,
                        title: 'Change your email',
                        validate: Validator.validateName,
                      ),
                      Constants.kSmallVerticalSpacing,
                      const DefaultTextField(
                        title: 'Change your phone',
                        validate: Validator.validateName,
                      ),
                      Constants.kSmallVerticalSpacing,
                      Constants.kSmallVerticalSpacing,
                      DefaultButton(
                        onPressed: () {
                          _formKey.currentState!.validate();
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








// // import 'package:conditional_builder/conditional_builder.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mazzad/constants.dart';
// import 'package:mazzad/controllers/layout_controller.dart';
// import 'package:mazzad/shared/comonents/components.dart';

// class EditProfileScreen extends StatelessWidget {
//   EditProfileScreen({Key? key}) : super(key: key);
//   static const routeName = '/edit_profile';

//   var nameController = TextEditingController();
//   var emailController = TextEditingController();
//   var phoneController = TextEditingController();

//   // ShopLayoutController shopLayoutController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<LayoutController>(
//       builder: (shopLayoutController) {
//         print(
//             '--->SettingsScreen.shopLayoutController.userModel!= __${shopLayoutController.userModel!}__');
//         var model = shopLayoutController.userModel!;
//         nameController.text = model.data!.name!;
//         emailController.text = model.data!.email!;
//         phoneController.text = model.data!.phone!;
//         return Scaffold(
//             appBar: AppBar(
//               title: Text('Update User'),
//               centerTitle: true,
//             ),
//             body: SingleChildScrollView(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Form(
//                     key: formKey,
//                     child: Column(
//                       children: [
//                         if (shopLayoutController.initUpdateUserData.value)
//                           LinearProgressIndicator(),
//                         const SizedBox(height: 20.0),
//                         defaultFormField(
//                           validate: (String? value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter your name';
//                             }
//                             return null;
//                           },
//                           type: TextInputType.name,
//                           controller: nameController,
//                           label: 'Name',
//                           prefix: Icons.person,
//                         ),
//                         const SizedBox(height: 20.0),
//                         defaultFormField(
//                           validate: (String? value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter your email address';
//                             }
//                             return null;
//                           },
//                           type: TextInputType.emailAddress,
//                           controller: emailController,
//                           label: 'Email Address',
//                           prefix: Icons.email,
//                         ),
//                         const SizedBox(height: 20.0),
//                         defaultFormField(
//                           validate: (String? value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter your phone';
//                             }
//                             return null;
//                           },
//                           type: TextInputType.phone,
//                           controller: phoneController,
//                           label: 'Phone',
//                           prefix: Icons.phone,
//                         ),
//                         const SizedBox(height: 20.0),
//                         defaultButton(
//                           function: () {
//                             if (formKey.currentState!.validate()) {
//                               shopLayoutController.updateUserData(
//                                 name: nameController.text,
//                                 email: emailController.text,
//                                 phone: phoneController.text,
//                               );
//                             }
//                           },
//                           text: 'Update',
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ));
//       },
//     );
//   }
// }


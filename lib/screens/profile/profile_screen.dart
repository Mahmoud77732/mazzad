import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazzad/controllers/layout_controller.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = 'profile_screen';
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(builder: (shopLayoutController) {
      return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Body(shopLayoutController),
    );
    });
  }
}


// ------------------------------------------------------
//! edit this to get profile data

// // ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

// import 'package:conditional_builder/conditional_builder.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:getxapi/controller/shop_layout_controller.dart';
// import 'package:getxapi/shared/comonents/components.dart';
// import 'package:getxapi/shared/comonents/constants.dart';

// class SettingsScreen extends StatelessWidget {
//   var formKey = GlobalKey<FormState>();

//   var nameController = TextEditingController();
//   var emailController = TextEditingController();
//   var phoneController = TextEditingController();

//   // ShopLayoutController shopLayoutController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ShopLayoutController>(
//       builder: (shopLayoutController) {
//         print('--->SettingsScreen.shopLayoutController.userModel!= __${shopLayoutController.userModel!}__');
//         var model = shopLayoutController.userModel!;
//         nameController.text = model.data!.name!;
//         emailController.text = model.data!.email!;
//         phoneController.text = model.data!.phone!;
//         return SingleChildScrollView(
//           child: ConditionalBuilder(
//             condition: shopLayoutController.userModel != null,
//             builder: (context) {
//               return Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     children: [
//                       if(shopLayoutController.initUpdateUserData.value)
//                         LinearProgressIndicator(),
//                       const SizedBox(height: 20.0),
//                       defaultFormField(
//                         validate: (String? value) {
//                           if (value!.isEmpty) {
//                             return 'Please enter your name';
//                           }
//                           return null;
//                         },
//                         type: TextInputType.name,
//                         controller: nameController,
//                         label: 'Name',
//                         prefix: Icons.person,
//                       ),
//                       const SizedBox(height: 20.0),
//                       defaultFormField(
//                         validate: (String? value) {
//                           if (value!.isEmpty) {
//                             return 'Please enter your email address';
//                           }
//                           return null;
//                         },
//                         type: TextInputType.emailAddress,
//                         controller: emailController,
//                         label: 'Email Address',
//                         prefix: Icons.email,
//                       ),
//                       const SizedBox(height: 20.0),
//                       defaultFormField(
//                         validate: (String? value) {
//                           if (value!.isEmpty) {
//                             return 'Please enter your phone';
//                           }
//                           return null;
//                         },
//                         type: TextInputType.phone,
//                         controller: phoneController,
//                         label: 'Name',
//                         prefix: Icons.phone,
//                       ),
//                       const SizedBox(height: 20.0),
//                       defaultButton(
//                         function: () {
//                           if (formKey.currentState!.validate()) {
//                             shopLayoutController.updateUserData(
//                               name: nameController.text,
//                               email: emailController.text,
//                               phone: phoneController.text,
//                             );
//                           }
//                         },
//                         text: 'Update',
//                       ),
//                       const SizedBox(height: 20.0),
//                       defaultButton(
//                         function: () {
//                           signOut(shopLayoutController);
//                         },
//                         text: 'Logout',
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//             fallback: (context) => Center(child: CircularProgressIndicator()),
//           ),
//         );
//       },
//     );
//   }
// }

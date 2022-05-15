import 'package:get/get.dart';

class AuthTextFieldController extends GetxController {
  String password = '',
      confirmPassword = '',
      email = '',
      name = '',
      phoneNumber = '';
  AuthTextFieldController() {
    resetFields();
  }

  void updateEmail({required String newEmail}) {
    email = newEmail;
    update();
  }

  void updatePhoneNumber({required String newPhoneNumber}) {
    phoneNumber = newPhoneNumber;
    update();
  }

  void updateUserName({required String newName}) {
    name = newName;
    update();
  }

  void updatePassword({required String newPassword}) {
    password = newPassword;
    update();
  }

  // reset text fields
  void resetFields() {
    password = '';
    confirmPassword = '';
    email = '';
    name = '';
    phoneNumber = '';
    update();
  }
}

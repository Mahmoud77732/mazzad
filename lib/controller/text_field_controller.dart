import 'package:get/get.dart';

class TextFieldController extends GetxController {
  String password = '',
      confirmPassword = '',
      email = '',
      name = '',
      phoneNumber = '',
      auctionName = '',
      auctionDescription = '';
  int auctionInitialPrice = 0;
  TextFieldController() {
    resetFields();
  }

  void updatePrice({required int newInitialPrice}) {
    auctionInitialPrice = newInitialPrice;
    update();
  }

  void updateProductName({required String newProductName}) {
    auctionName = newProductName;
    update();
  }

  void updateProductDescription({required String newProductDescription}) {
    auctionDescription = newProductDescription;
    update();
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

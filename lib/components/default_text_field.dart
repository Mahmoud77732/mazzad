import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazzad/controller/text_field_controller.dart';

import '../constants.dart';

class DefaultTextField extends StatefulWidget {
  const DefaultTextField(
      {Key? key,
      this.title,
      this.isSecure = false,
      this.isLargeText = false,
      this.validate,
      this.initialValue,
      this.passwordFieldKey})
      : super(key: key);
  final String? title;
  final bool? isSecure;
  final bool? isLargeText;
  final String? initialValue;
  final String? Function(String?)? validate;
  final GlobalKey<FormFieldState<String>>? passwordFieldKey;
  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool isVisible = true;
  final controller = Get.put<TextFieldController>(TextFieldController());
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.title == 'Password' ? widget.passwordFieldKey : null,
      validator: widget.passwordFieldKey != null
          ? (value) {
              if (value == null || value.isEmpty) {
                return 'Password Required';
              }
              if (value != widget.passwordFieldKey!.currentState!.value) {
                return 'Password do not match';
              }
              return null;
            }
          : widget.validate,
      maxLines: widget.isLargeText! ? 6 : 1,
      initialValue: widget.initialValue,
      onChanged: (value) {
        switch (widget.title) {
          case 'Email Address':
          case 'Your Email':
          case 'Email':
            {
              controller.updateEmail(newEmail: value);
            }
            break;
          case 'Password':
            {
              controller.updatePassword(newPassword: value);
            }
            break;
          case "Name":
            {
              controller.updateUserName(newName: value);
            }
            break;
          case "Phone":
            {
              controller.updatePhoneNumber(newPhoneNumber: value);
            }
            break;
          case 'product description...':
            {
              controller.updateProductDescription(newProductDescription: value);
            }
            break;
          case 'product name':
            {
              controller.updateProductName(newProductName: value);
            }
            break;
          case 'starting bid price':
            {
              controller.updatePrice(
                newInitialPrice: int.parse(value),
              );
            }
            break;
        }
      },
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Constants.kPrimaryColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusColor: Constants.kPrimaryColor,
        hoverColor: Constants.kPrimaryColor,
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        hintText: widget.title,
        suffixIcon: widget.isSecure!
            ? IconButton(
                icon:
                    Icon((isVisible) ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
              )
            : const SizedBox(),
        iconColor: Constants.kPrimaryColor,
        suffixIconColor: Constants.kPrimaryColor,
        prefixIconColor: Constants.kPrimaryColor,
      ),
      keyboardType: widget.isSecure!
          ? TextInputType.visiblePassword
          : widget.title == 'Phone' ||
                  widget.title == 'Phone number' ||
                  widget.title == 'starting bid price'
              ? const TextInputType.numberWithOptions()
              : widget.title == 'Name'
                  ? TextInputType.name
                  : TextInputType.emailAddress,
      obscureText: widget.isSecure! ? isVisible : false,
    );
  }
}

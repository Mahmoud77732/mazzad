import 'package:flutter/material.dart';

import '../constants.dart';

class DefaultTextField extends StatefulWidget {
  const DefaultTextField(
      {Key? key, this.title, this.isSecure = false, this.isLargeText = false})
      : super(key: key);
  final String? title;
  final bool? isSecure;
  final bool? isLargeText;

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: widget.isLargeText! ? 6 : 1,
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
          : TextInputType.emailAddress,
      obscureText: widget.isSecure! ? isVisible : false,
    );
  }
}

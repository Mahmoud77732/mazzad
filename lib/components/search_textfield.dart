import 'package:flutter/material.dart';

import '../constants.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      decoration: InputDecoration(
        focusColor: Constants.kPrimaryColor,
        hintText: "Search here",
        prefixIcon: const Icon(
          Icons.search,
          // color: Constants.kPrimaryColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Constants.kPrimaryColor.withOpacity(0.3),
          ),
        ),
        hoverColor: Constants.kPrimaryColor,
        fillColor: Constants.kPrimaryColor,
      ),
    );
  }
}

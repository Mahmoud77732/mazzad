import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:mazzad/screens/serach/search_screeen.dart';

import '../constants.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    this.onConfirmed,
  }) : super(key: key);
  final VoidCallback? onConfirmed;
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
      onSubmitted: (_) {
        onConfirmed;
      },
      onTap: () {
        // showSearch(context: context, delegate: CustomSearchDelegate());
        Get.to(SearchScreen());
      },
    );
  }
}


class CustomSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => "Looking for ..";

  @override
  TextStyle? get searchFieldStyle => const TextStyle(
        fontSize: 14,
      );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.close,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_rounded,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.trim().length < 2) {
      return const Center(
        child: Text(
          "type more than two letters",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      );
    }
// put ur search here
    return Center(
        child: Lottie.asset(
      'assets/animations/searching_animation.json',
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchScreenDelegate extends SearchDelegate {
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

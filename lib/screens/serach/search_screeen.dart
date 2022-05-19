// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:mazzad/controller/search_controller.dart';

import '../../shared/comonents/components.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // SearchController searchController = Get.find();
  var searchSuccessState = false;
  final SearchController searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchTextController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            defaultFormField(
              controller: searchTextController,
              type: TextInputType.text,
              validate: (String? value) {
                if (value!.isEmpty) {
                  return 'enter text to search';
                }
                return null;
              },
              onSubmit: (String text) {
                searchController.search(text).then((value) {
                  setState(() {
                    searchSuccessState = true;
                  });
                });
              },
              label: 'Search',
              prefix: Icons.search,
            ),
            const SizedBox(height: 10.0),
            const LinearProgressIndicator(),
            if (searchSuccessState)
              buildListAuction(
                searchController.searchModel!,
                context,
              ),
          ],
        ),
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// class SearchScreenDelegate extends SearchDelegate {
//   @override
//   String? get searchFieldLabel => "Looking for ..";

//   @override
//   TextStyle? get searchFieldStyle => const TextStyle(
//         fontSize: 14,
//       );

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: const Icon(
//           Icons.close,
//         ),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(
//         Icons.arrow_back_rounded,
//       ),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     if (query.trim().length < 2) {
//       return const Center(
//         child: Text(
//           "type more than two letters",
//           style: TextStyle(
//             color: Colors.grey,
//           ),
//         ),
//       );
//     }
// // put ur search here
//     return Center(
//         child: Lottie.asset(
//       'assets/animations/searching_animation.json',
//     ));
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return Container();
//   }
// }

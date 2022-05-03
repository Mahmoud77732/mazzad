import 'package:flutter/material.dart';
import 'package:mazzad/components/search_textfield.dart';
import 'package:mazzad/constants.dart';

import '../../size_config.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  static const routeName = '/categories_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Constants.kHorizontalSpacing),
        child: Column(
          children: [
            Constants.kSmallVerticalSpacing,
            const SearchTextField(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Expanded(
              child: GridView(
                  children:
                      List.generate(Constants.kDummyCategories.length, (index) {
                    return Constants.kDummyCategories[index];
                  }),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  )
                  // shrinkWrap: true,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
//TODO: change the padding in categories item and dont remove the earch field padding


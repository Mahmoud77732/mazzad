import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/category_button.dart';
import '../../components/search_textfield.dart';
import '../../constants.dart';
import '../../controller/categories_controller.dart';
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
              child: GetBuilder<CategoriesController>(
                  init: CategoriesController(),
                  builder: (categoryController) {
                    return GridView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      children: List.generate(
                        categoryController.categories.length,
                        (index) {
                          print(categoryController.categories[index].icon);
                          return CategoryButton(
                            color: categoryController.randomColor,
                            icon: categoryController.categories[index].icon,
                            onPress: () {},
                            name: categoryController.categories[index].name,
                          );
                        },
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 4 / 5,
                      ),
                      // shrinkWrap: true,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

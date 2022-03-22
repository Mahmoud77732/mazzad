import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazzad/components/category_button.dart';
import 'package:mazzad/components/search_textfield.dart';

import '../../size_config.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  static const routeName = '/categories_screen';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SearchTextField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Expanded(
            child: GridView(
              children: List.generate(50, (index) {
                return SizedBox(
                  height: getProportionateScreenHeight(90),
                  child: CategoryButton(
                    color: Colors.amber,
                    icon: Icons.category,
                    onPress: () {},
                    name: 'All',
                  ),
                );
              }),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              // shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}

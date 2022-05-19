import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:mazzad/components/default_button.dart';
import 'package:mazzad/components/default_text_field.dart';
import 'package:mazzad/constants.dart';
import 'package:mazzad/controller/auction_controller.dart';
import 'package:mazzad/controller/categories_controller.dart';

class AddProductScreen extends StatelessWidget {
  final categoriesController = Get.find<CategoriesController>();
  AddProductScreen({Key? key}) : super(key: key);
  static const String routeName = '/add_product_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(Constants.kHorizontalSpacing),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          const DefaultTextField(
            title: 'product name',
          ),
          Constants.kSmallVerticalSpacing,
          const DefaultTextField(
            title: 'product description...',
            isLargeText: true,
          ),
          Constants.kSmallVerticalSpacing,
          const DefaultTextField(
            title: 'starting bid price',
          ),
          Constants.kSmallVerticalSpacing,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Auciton Types',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  // MyDropDownButton(
                  //     myDropDownItems: Status.values
                  //         .map((e) => {
                  //               'name': e.name,
                  //               'id': e.index.toString(),
                  //             })
                  //         .toList(),
                  //     isAuctionType: true),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Category',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  MyDropDownButton(
                    myDropDownItems: categoriesController.categoriesNameAndId,
                    isAuctionType: false,
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  DatePicker.showDatePicker(
                    context,
                    showTitleActions: true,
                    minTime: DateTime.now(),
                    onChanged: (date) {
                      print('change $date');
                    },
                    onConfirm: (date) {
                      print('confirm $date');
                    },
                    currentTime: DateTime.now(),
                  );
                },
                child: const Text('start date time'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('end date time'),
              ),
            ],
          ),
          DefaultButton(onPressed: () {}, text: 'place auction'),
        ],
      ),
    );
  }
}

class MyDropDownButton extends StatefulWidget {
  MyDropDownButton(
      {Key? key, required this.myDropDownItems, this.isAuctionType})
      : super(key: key);
  final List<Map<String?, String?>> myDropDownItems;
  bool? isAuctionType = false;
  @override
  State<MyDropDownButton> createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  final controller = Get.find<AuctionController>();
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue ?? widget.myDropDownItems[0]['name'],
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
        // if (widget.isAuctionType!) {
        //   controller.updateAuctionType(newAuctionType: newValue);
        //   print(controller.auctionType);
        // } else {
        //   Map<String?, String?> mySelectedItem = widget.myDropDownItems
        //       .firstWhere((element) => element['name'] == dropdownValue);
        //   controller.updateCategoryAcutionId(
        //     mySelectedCategoryId: int.parse(
        //       mySelectedItem['id']!,
        //     ),
        //   );
        // }
      },
      items: widget.myDropDownItems.map<DropdownMenuItem<String>>((Map? value) {
        return DropdownMenuItem<String>(
          value: value!['name'],
          child: Text(value['name'] ?? ''),
        );
      }).toList(),
    );
  }
}

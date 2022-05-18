import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:mazzad/components/auction_item.dart';
import 'package:mazzad/components/default_button.dart';
import 'package:mazzad/components/default_text_field.dart';
import 'package:mazzad/constants.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);
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
                children: [
                  const Text(
                    'Auciton Types',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  MyDropDownButton(
                      myDropDownItems:
                          Status.values.map((e) => e.name).toList()),
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
                      myDropDownItems:
                          Status.values.map((e) => e.name).toList()),
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
  const MyDropDownButton({Key? key, required this.myDropDownItems})
      : super(key: key);
  final List<String> myDropDownItems;
  @override
  State<MyDropDownButton> createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = widget.myDropDownItems[1];
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items:
          widget.myDropDownItems.map<DropdownMenuItem<String>>((String? value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value ?? ''),
        );
      }).toList(),
    );
  }
}

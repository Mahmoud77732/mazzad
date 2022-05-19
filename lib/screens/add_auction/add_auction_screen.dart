// ignore_for_file: prefer_collection_literals, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:mazzad/components/default_button.dart';
import 'package:mazzad/constants.dart';
import 'package:mazzad/controller/auction_controller.dart';
import 'package:mazzad/controller/categories_controller.dart';
import 'package:mazzad/models/added_auction_model.dart';
import 'package:mazzad/shared/comonents/components.dart';

import '../../components/auction_item.dart';

final AuctionController auctionController = Get.find<AuctionController>();

class AddAuctionScreen extends StatelessWidget {
  final categoriesController = Get.find<CategoriesController>();
  // final auctionController = Get.find<AuctionController>();
  // final AddedAuctionModel? addedAuctionModel = AddedAuctionModel();
  AddAuctionScreen({Key? key}) : super(key: key);
  static const String routeName = '/add_product_screen';
  @override
  Widget build(BuildContext context) {
    // final addedAuctionModel = AddedAuctionModel();
    var nameTextController = TextEditingController();
    var descriptionTextController = TextEditingController();
    var priceTextController = TextEditingController();
    String startDateTextValue = '';
    String endDateTextValue = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Auction'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(Constants.kHorizontalSpacing),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          defaultFormField(
            controller: nameTextController,
            type: TextInputType.text,
            validate: (String? value) {
              if (value!.isEmpty) {
                return 'enter name';
              }
              return null;
            },
            // onSubmit: (String text) {
            //   // auctionController.addedAuctionModel!.data!.name = text;
            //   addedAuctionModel.data!.name = text;
            // },
            label: 'product name...',
          ),
          const SizedBox(height: 10),
          defaultFormField(
            noOfLines: 6,
            controller: descriptionTextController,
            type: TextInputType.text,
            validate: (String? value) {
              if (value!.isEmpty) {
                return 'enter description';
              }
              return null;
            },
            // onSubmit: (String text) {
            //   addedAuctionModel.data!.description = text;
            // },
            label: 'product description...',
          ),
          const SizedBox(height: 10),
          // Constants.kSmallVerticalSpacing,
          // Constants.kSmallVerticalSpacing,
          defaultFormField(
            controller: priceTextController,
            type: TextInputType.text,
            validate: (String? value) {
              if (value!.isEmpty) {
                return 'enter initial price';
              }
              return null;
            },
            // onSubmit: (String text) {
            //   addedAuctionModel.data!.initialPrice = text;
            // },
            // onChange: () {
            //   print('---> addedAuctionModel!: $addedAuctionModel');
            // },
            label: 'starting bid price',
          ),
          const SizedBox(height: 10),
          // Constants.kSmallVerticalSpacing,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Auciton Types',
                    style: TextStyle(color: Colors.grey),
                  ),
                  MyDropDownButton(
                    myDropDownItems: Status.values
                        .map((e) => {
                              'name': e.name,
                              'id': e.index.toString(),
                            })
                        .toList(),
                    isAuctionType: true,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Category',
                    style: TextStyle(color: Colors.grey),
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
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      DatePicker.showDatePicker(
                        context,
                        showTitleActions: true,
                        minTime: DateTime.now(),
                        // onChanged: (date) {
                        //   print('----> (1) change: $date');
                        // },
                        onConfirm: (date) {
                          startDateTextValue = date.year.toString() +
                              '-' +
                              ((date.month < 10)
                                  ? ('0' + date.month.toString())
                                  : date.month.toString()) +
                              '-' +
                              ((date.day < 10)
                                  ? ('0' + date.day.toString())
                                  : date.day.toString()) +
                              'T';
                        },
                        currentTime: DateTime.now(),
                      );
                    },
                    child: const Text('start date'),
                  ),
                  TextButton(
                    onPressed: () {
                      DatePicker.showTimePicker(
                        context,
                        showTitleActions: true,
                        currentTime: DateTime.now(),
                        // onChanged: (time) {
                        //   print('----> (1) change: $time');
                        // },
                        onConfirm: (time) {
                          startDateTextValue += ((time.hour < 10)
                                  ? ('0' + time.hour.toString())
                                  : time.hour.toString()) +
                              ':' +
                              ((time.minute < 10)
                                  ? ('0' + time.minute.toString())
                                  : time.minute.toString());
                          print('----> (1) confirm $startDateTextValue');
                        },
                      );
                    },
                    child: const Text('start time'),
                  ),
                ],
              ),
              /*
                String date = "2019-07-14T18:30:00.000Z";
                SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
                SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss a");
                Date parsedDate = inputFormat.parse(date);
                String formattedDate = outputFormat.format(parsedDate);
                System.out.println(formattedDate);
              */
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      DatePicker.showDatePicker(
                        context,
                        showTitleActions: true,
                        minTime: DateTime.now(),
                        onConfirm: (date) {
                          endDateTextValue = date.year.toString() +
                              '-' +
                              ((date.month < 10)
                                  ? ('0' + date.month.toString())
                                  : date.month.toString()) +
                              '-' +
                              ((date.day < 10)
                                  ? ('0' + date.day.toString())
                                  : date.day.toString()) +
                              'T';
                        },
                        currentTime: DateTime.now(),
                      );
                    },
                    child: const Text('end date'),
                  ),
                  TextButton(
                    onPressed: () {
                      DatePicker.showTimePicker(
                        context,
                        showTitleActions: true,
                        currentTime: DateTime.now(),
                        onConfirm: (time) {
                          endDateTextValue += ((time.hour < 10)
                                  ? ('0' + time.hour.toString())
                                  : time.hour.toString()) +
                              ':' +
                              ((time.minute < 10)
                                  ? ('0' + time.minute.toString())
                                  : time.minute.toString());
                          print('----> (2) confirm $endDateTextValue');
                        },
                      );
                    },
                    child: const Text('end time'),
                  ),
                ],
              ),
            ],
          ),
          DefaultButton(
            text: 'place auction',
            onPressed: () {
              print('---> (1) auctionType: ${auctionController.auctionType}');
              print('---> (1) categoryId: ${auctionController.categoryId}');
              print(
                  '---> (1) nameTextController.text: ${nameTextController.text}');
              AddedAuctionModel addedAuctionModel = AddedAuctionModel(
                  name: nameTextController.text,
                  images: ['ddd1', 'ddd2'],
                  type: auctionController.auctionType,
                  startDate: startDateTextValue,
                  endDate: endDateTextValue,
                  description: descriptionTextController.text,
                  categoryId: auctionController.categoryId.toString(),
                  initialPrice: priceTextController.text,
                  keywords: ['keywords']);

              auctionController.postAuction(addedAuctionModel)!.then((value) {
                print(value);
              });
            },
          ),
        ],
      ),
    );
  }
}

class MyDropDownButton extends StatefulWidget {
  final List<Map<String?, String?>> myDropDownItems;
  bool? isAuctionType = false;
  MyDropDownButton({
    Key? key,
    required this.myDropDownItems,
    this.isAuctionType,
  }) : super(key: key);
  @override
  State<MyDropDownButton> createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  // final auctionController = Get.find<AuctionController>();
  String? dropdownValue;

  _MyDropDownButtonState();

  @override
  Widget build(BuildContext context) {
    var seen = Set<Map<String?, String?>>();
    List<Map<String?, String?>> uniquelist =
        widget.myDropDownItems.where((element) {
      bool exist = false;
      for (var i in seen) {
        if (i['name'] == element['name']) exist = true;
      }
      if (exist) {
        return false;
      } else {
        return seen.add(element);
      }
    }).toList();
    print('---> uniquelist: $uniquelist');
    return DropdownButton<String>(
      // value: dropdownValue ?? widget.myDropDownItems[0]['name'],
      value: dropdownValue ?? uniquelist[0]['name'],
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
        if (widget.isAuctionType!) {
          auctionController.updateAuctionName(newAuctionType: newValue);
          print('---> auctionType: ${auctionController.auctionType}');
          // print('---> auctionController.addedAuctionModel!: ${addedAuctionModel.data}');
          // addedAuctionModel.data!.type = newValue;
        } else {
          // Map<String?, String?> mySelectedItem = widget.myDropDownItems
          Map<String?, String?> mySelectedItem = uniquelist
              .firstWhere((element) => element['name'] == dropdownValue);
          // addedAuctionModel.data!.categoryId = mySelectedItem['id'];
          auctionController.updateCategoryAcutionId(
            mySelectedCategoryId: int.parse(
              mySelectedItem['id']!,
            ),
          );
          print('---> categoryId: ${auctionController.categoryId}');
        }
      },
      // items: widget.myDropDownItems.map<DropdownMenuItem<String>>((Map? value) {
      items: uniquelist.map<DropdownMenuItem<String>>((Map? value) {
        return DropdownMenuItem<String>(
          value: value!['name'],
          child: Text(value['name'] ?? ''),
        );
      }).toList(),
    );
  }
}

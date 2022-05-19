// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazzad/components/auction_item.dart';
import 'package:mazzad/constants.dart';
import 'package:mazzad/models/search_model.dart';

import '../../controller/layout_controller.dart';

LayoutController layoutController = Get.find();

Widget defaultButton(
        {double width = double.infinity,
        Color background = Colors.blue,
        bool isUpperCase = true,
        double radius = 10.0,
        required Function function,
        required String text}) =>
    Container(
      width: width,
      height: 40,
      child: MaterialButton(
        onPressed: () => function(),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  IconData? prefix,
  // required Function validate,
  required String? Function(String?)? validate,
  Function? onTap,
  // Function? onSubmit,
  final void Function(String str)? onSubmit,
  Function? onChange,
  Function? suffixPressed,
  IconData? suffix,
  int? noOfLines,
  bool isPassword = false,
  bool isClickable = true,
}) =>
    TextFormField(      
      maxLines: (noOfLines != null) ? noOfLines : 1,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      // enabled: isClickable,
      // onFieldSubmitted: onSubmit,
      onFieldSubmitted: (s) {
        (onSubmit != null) ? onSubmit(s) : null;
      },
      onChanged: (onChange != null) ? onChange() : null,
      // onChanged: (s) {
      //   onChange!();
      // },
      validator: validate,
      // validator: (str) {
      //   validate();
      //   return null;
      // },
      onTap: (onTap != null)
          ? () {
              onTap();
            }
          : null,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: (prefix != null) ? Icon(prefix) : null,
        suffixIcon: (suffix != null)
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(suffix),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );

Widget defaultTextButton({
  required Function function,
  required String text,
}) =>
    TextButton(onPressed: () {}, child: Text(text.toUpperCase()));

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );

Widget buildSeparator() => Container(
      height: 1.0,
      width: double.infinity,
      color: Colors.grey[300],
    );

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget buildListAuction(List<AuctionElement> auctionElements, context) {
  print('---> buildListAuction()');
  return Expanded(
    child: GridView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: Constants.kHorizontalSpacing,
        mainAxisSpacing: Constants.kHorizontalSpacing / 2,
        crossAxisCount: 2,
      ),
      children: List.generate(
        auctionElements.length,
        (index) => AuctionItem(
          name: auctionElements[index].name!,
          image: auctionElements[index].images!,
          currentBid: 500, //dummy
          status: getStatus(auctionElements[index].type!),
        ),
      ),
    ),
  );
  // return Column(
  //   children: List.generate(
  //     auctionElements.length,
  //     (index) => AuctionItem(
  //       name: auctionElements[index].name!,
  //       image: auctionElements[index].images![0],
  //       currentBid: 500, //dummy
  //       status: getStatus(auctionElements[index].type!),
  //     ),
  //   ),
  // );
}

// enum MyStatus { live, scheuled, soon }

getStatus(String type) {
  if (type == 'live') {
    return Status.live;
  } else if (type == 'scheduled') {
    return Status.scheduled;
  } else {
    return Status.soon;
  }
}

/*
const AuctionItem(
      image: 'assets/images/product.jpeg',
      name: 'Best controller ever',
      currentBid: 500,
      status: Status.live,
    ),
*/

Widget buildListProduct(model, context, {bool isOldPrice = true}) {
  print('---> buildListProduct()');
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: SizedBox(
      height: 120.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage('${model!.image}'),
                  width: 120.0,
                  height: 120.0,
                  // fit: BoxFit.cover,
                ),
                // if (model.discount != 0)
                if (model.discount != 0 && isOldPrice)
                  Container(
                      color: Colors.redAccent,
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        'DISCOUNT',
                        style: TextStyle(fontSize: 8.0, color: Colors.white),
                      )),
              ],
            ),
          ),
          SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.name}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14.0, height: 1.3),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      '${model.price.round()}',
                      style:
                          TextStyle(fontSize: 12.0, color: Colors.blueAccent),
                    ),
                    SizedBox(width: 5.0),
                    if (model.discount != 0 && isOldPrice)
                      Text(
                        (model.oldPrice != null)
                            ? model.oldPrice.round().toString()
                            : '',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    Spacer(),
                    IconButton(
                      // padding: EdgeInsets.zero,
                      onPressed: () {
                        // layoutController.changeFavorites(model.id!);
                      },
                      icon: CircleAvatar(
                        radius: 15.0,
                        backgroundColor:
                            (layoutController.favorites![model.id]!)
                                ? Colors.blueAccent
                                : Colors.grey,
                        child: Icon(
                          Icons.favorite_border,
                          size: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

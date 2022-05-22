import 'package:flutter/material.dart';

import './auction_item.dart';
import '../constants.dart';
import '../models/auction/auction.dart';

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
      onFieldSubmitted: (s) {
        (onSubmit != null) ? onSubmit(s) : null;
      },
      onChanged: (onChange != null) ? onChange() : null,
      validator: validate,
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
        border: const OutlineInputBorder(),
      ),
    );

Widget buildListAuction(List<Auction> auctionElements, context) {
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
          myAuction: Auction(
              id: auctionElements[index].id,
              category_id: auctionElements[index].category_id,
              name: auctionElements[index].name,
              description: auctionElements[index].description,
              images: auctionElements[index].images,
              initial_price: auctionElements[index].initial_price,
              start_date: auctionElements[index].start_date,
              end_date: auctionElements[index].end_date,
              type: auctionElements[index].type,
              keywords: auctionElements[index].keywords),
        ),
      ),
    ),
  );
}

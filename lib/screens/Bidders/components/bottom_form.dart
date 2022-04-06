// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mazzad/components/default_button.dart';
import 'package:mazzad/constants.dart';
import 'package:mazzad/size_config.dart';

class BottomForm extends StatelessWidget {
  const BottomForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 25),
          height: getProportionateScreenHeight(53),
          width: double.infinity,
          // color: Color.fromARGB(255, 230, 227, 227),
          color: Colors.white,
          child: Text('Can you bid more?',
              style: TextStyle(color: Colors.black, fontSize: 21)),
        ),
        Container(
          padding: EdgeInsets.all(10),
          color: Color(0xFFC4C4C4),
          height: getProportionateScreenHeight(80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width:
                    getProportionateScreenWidth(SizeConfig.screenWidth / 2.3),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter your bid',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 102, 98, 98)),
                    contentPadding:
                        EdgeInsets.all(getProportionateScreenHeight(18)),
                    isDense: true,
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Constants.kSmallHorizontalSpacing,
              Expanded(
                child: DefaultButton(
                  onPressed: () {},
                  text: 'Bid',
                ),
              )
            ],
          ),
        ),
        // SizedBox(height: 5)
      ],
    );
  }
}

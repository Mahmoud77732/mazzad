// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30),
      child: Column(
        children: [
          Row(
            children: [
              Text('Product Name',
              textScaleFactor: 1.2,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text('Description',
                  textScaleFactor: 1.1,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
            ],
          ),
          SizedBox(height: 13),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.88,
            height: 100,
            child: Text(
              'some text goes here. some text goes here. some text goes here. some text goes here. some text goes here. some text goes here. some text goes here. some text goes here. some text goes here. some text goes here.',
              style: TextStyle(color: Color.fromARGB(255, 122, 122, 122)),
            ),
          )
        ],
      ),
    );
  }
}
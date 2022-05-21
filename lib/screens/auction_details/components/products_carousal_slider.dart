// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazzad/controller/details_controller.dart';

class ProductsCarousalSlider extends StatefulWidget {
  @override
  State<ProductsCarousalSlider> createState() => _ProductsCarousalSliderState();
}

class _ProductsCarousalSliderState extends State<ProductsCarousalSlider> {
  List<String> imageList = [
    'assets/images/slider1.jpg',
    'assets/images/slider2.jpg',
    'assets/images/slider3.jpg',
    'assets/images/slider8.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    DetailsController detailsController = Get.find<DetailsController>();
    print('----> (3) arguments: ${detailsController.argumentsValues}');
    imageList = detailsController.argumentsValues!['image'];
    return CarouselSlider(
      items: imageList
          .map((linkIndex) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(fit: StackFit.expand, children: [
                // Image.asset(linkIndex.toString(), fit: BoxFit.cover),
                Image.network(linkIndex.toString(), fit: BoxFit.cover),
                Positioned.fill(
                  top: 130,
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5,
                          spreadRadius: 1),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        spreadRadius: 10,
                        // offset: Offset(1, 15),
                      ),
                    ]),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        // "1080\$",
                        "${detailsController.argumentsValues!['current_bid']}\$",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ])))
          .toList(),
      options: CarouselOptions(
        autoPlay: false,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        height: 170,
      ),
    );
  }
}

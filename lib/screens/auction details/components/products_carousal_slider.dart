// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
    return CarouselSlider(
      items: imageList
          .map((linkIndex) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(fit: StackFit.expand, children: [
                Image.asset(linkIndex.toString(), fit: BoxFit.cover),
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
                        "1080\$",
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

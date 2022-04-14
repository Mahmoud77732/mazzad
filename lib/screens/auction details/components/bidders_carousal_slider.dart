// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mazzad/models/bidder.dart';
import 'package:mazzad/size_config.dart';

import '../../../constants.dart';

class TopFiveBiddersCarousalSlider extends StatefulWidget {
  final List<Bidder>? bidders;
  const TopFiveBiddersCarousalSlider({this.bidders});
  @override
  State<TopFiveBiddersCarousalSlider> createState() =>
      _TopFiveBiddersCarousalSliderState();
}

class _TopFiveBiddersCarousalSliderState
    extends State<TopFiveBiddersCarousalSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Constants.kHorizontalSpacing,
          ),
          child: Text(
            'Top 5 Bidders',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(18),
            ),
          ),
        ),
        CarouselSlider(
          items: widget.bidders!
              .map(
                (bidder) => Card(
                  elevation: 10,
                  child: ListTile(
                    onTap: () {},
                    leading: CircleAvatar(
                      radius: 23,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(
                          bidder.image ?? "assets/images/profile_pic.jpg"),
                    ),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Bid By ',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              TextSpan(
                                text: bidder.name ?? "unkwon",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          DateFormat('yMMMMd')
                              .format(bidder.date ?? DateTime.now())
                              .toString(),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    trailing: Text(
                      '\$${bidder.price ?? 0.0}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            autoPlay: false,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            height: 64,
          ),
        ),
      ],
    );
  }
}

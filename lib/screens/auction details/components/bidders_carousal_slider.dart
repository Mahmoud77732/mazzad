// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mazzad/screens/Bidders/components/bidder.dart';

class BiddersCarousalSlider extends StatefulWidget {
  @override
  State<BiddersCarousalSlider> createState() => _BiddersCarousalSliderState();
}

class _BiddersCarousalSliderState extends State<BiddersCarousalSlider> {
  List<Bidder> bidderList = [
    Bidder(name: 'Bidder Name', price: '1080'),
    Bidder(name: 'Bidder Name', price: '1080'),
    Bidder(name: 'Bidder Name', price: '1080'),
    Bidder(name: 'Bidder Name', price: '1080'),
    Bidder(name: 'Bidder Name', price: '1080'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.orangeAccent,
      margin: EdgeInsets.only(bottom: 70),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 30),
            child: Text('Top 5 Bidders', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          ),
          CarouselSlider(
            items: bidderList.map((bidder) => 
              Card(
                elevation: 10,
                child: ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                    radius: 23,
                    backgroundColor: Colors.transparent,
                    child: Image.asset('assets/images/comvzhssmyverizon.png')
                  ),
                  title: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    // width: 150,
                    // color: Colors.grey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(bidder.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                          ],
                        ),
                        Row(
                          children: [
                            Text('11d 15h', style: TextStyle(fontSize: 11, color: Color.fromARGB(255, 41, 40, 40))),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Monday, March 21, 2022', style: TextStyle(fontSize: 11, color: Color.fromARGB(255, 41, 40, 40))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  trailing: Text('${bidder.price}\$', textScaleFactor: 1.3, style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              )
              ).toList(),
            options: CarouselOptions(
              autoPlay: false,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              height: 64,
            ),
          ),
        ],
      ),
    );
  }
}
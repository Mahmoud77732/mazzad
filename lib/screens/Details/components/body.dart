// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mazzad/screens/Details/components/bidders_carousal_slider.dart';
import 'package:mazzad/screens/Details/components/products_carousal_slider.dart';
import 'package:mazzad/screens/Details/components/product_info.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BodyState();
  }
}

class BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ProductsCarousalSlider(),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 65),
                            child: Text('creator', style: TextStyle( color: Colors.grey, fontSize: 15)),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 55),
                            child: Text('status', style: TextStyle(color: Colors.grey, fontSize: 15)),
                        ),
                      ]),
                  Card(
                    elevation: 0,
                    child: ListTile(
                        onTap: () {},
                        leading: CircleAvatar(
                          radius: 23,
                          backgroundColor: Colors.transparent,
                          child: Image.asset('assets/images/comvzhssmyverizon.png'),
                        ),  
                        title: Container(
                          margin: EdgeInsets.only(right: 17),
                          child: Text('bidder.name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                        trailing: Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 15, 0),
                          padding: EdgeInsets.fromLTRB(6, 6, 6, 6),
                          width: 55,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 246, 180, 180),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                radius: 6,
                                backgroundColor: Color.fromARGB(255, 236, 34, 34),
                                child: null,
                              ),
                              Text('live', style: TextStyle(color: Color.fromARGB(255, 236, 34, 34), fontSize: 17, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic))
                            ],
                          )
                        ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            ProductInfo(),
            BiddersCarousalSlider(),
          ],
        ),
      ),
    );
  }
}




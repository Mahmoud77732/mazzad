// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mazzad/screens/Bidders/components/bidder.dart';

class BidderCard extends StatefulWidget {
  const BidderCard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BidderCardState();
  }
}

class BidderCardState extends State<BidderCard> {
  List<Bidder> bidderList = [
    Bidder(name: 'Bidder Name', price: '1080'),
    Bidder(name: 'Bidder Name', price: '1080'),
    Bidder(name: 'Bidder Name', price: '1080'),
    Bidder(name: 'Bidder Name', price: '1080'),
    Bidder(name: 'Bidder Name', price: '1080'),
    Bidder(name: 'Bidder Name', price: '1080'),
    Bidder(name: 'Bidder Name', price: '1080'),
    Bidder(name: 'Bidder Name', price: '1080'),
    Bidder(name: 'Bidder Name', price: '1080'),
    Bidder(name: 'Bidder Name', price: '1080'),
    Bidder(name: 'Bidder Name', price: '1080'),
    Bidder(name: 'Bidder Name', price: '1080'),
    Bidder(name: 'Bidder Name', price: '1080'),
    Bidder(name: 'Bidder Name', price: '1080'),
    Bidder(name: 'Bidder Name', price: '1080'),
    Bidder(name: 'Bidder Name', price: '1080'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          ...bidderList.map((bidder) => 
          Card(
            // elevation: 0,
            child: ListTile(
              onTap: () {},
              leading: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.transparent,
                child: Image.asset('assets/images/comvzhssmyverizon.png'),
              ),
              title: Text(bidder.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              // subtitle: Text(''),
              trailing: Text('${bidder.price}\$', textScaleFactor: 1.2, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ),
          )
          ).toList(),
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mazzad/screens/Bidders/main_bidders.dart';
import 'package:mazzad/screens/Details/components/body.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DetailsScreenState();
  }
}

class DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details',
            style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        // elevation: 0,
      ),
      body: Body(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 23),
            child: ElevatedButton(
              child: Text('Place bid',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                padding: MaterialStateProperty.all(
                    EdgeInsets.fromLTRB(135.0, 12.0, 135.0, 12.0)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.deepOrange),
                  ),
                ),
              ),
              onPressed: () => selectScreen(context),
            ),
          ),
        ],
      ),
    );
  }

  selectScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return MainBidders();
    }));
  }
}

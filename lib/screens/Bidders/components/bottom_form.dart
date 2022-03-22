// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';

class BottomForm extends StatelessWidget {
  const BottomForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 230, 227, 227),
      // padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 25),
            height: 53,
            width: double.infinity,
            // color: Color.fromARGB(255, 230, 227, 227),
            color: Colors.white,
            child: Text('Can you bid more?', style: TextStyle(color: Colors.black, fontSize: 21)),
          ),
          Container(
            height: 63,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter your bid',
                      hintStyle: TextStyle(color: Color.fromARGB(255, 102, 98, 98)),
                      contentPadding: EdgeInsets.all(12),
                      isDense: true,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Bid',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                    padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: Colors.deepOrange),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5)
        ],
      ),
    );
  }
}

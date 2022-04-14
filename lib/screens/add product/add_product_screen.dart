import 'package:flutter/material.dart';
import 'package:mazzad/components/default_button.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);
  static const String routeName = '/add_product_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: ListView(
        children: [
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              hintText: 'Product Name',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              hintText: 'Product Desciption',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              hintText: 'Start bid price',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          Row(
            children: const [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  hintText: 'start time',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  hintText: 'ending time',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ],
          ),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              hintText: 'category',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              hintText: 'type',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          DefaultButton(
            onPressed: () {},
            text: 'place product',
          ),
        ],
      ),
    );
  }
}
// TODO make textfiled compnent
// TODO auto generate textfield as components
// TODO change the themedata inside the whole app , for app bar , font family and font size 
// TODO make validation for all textfields inputs
// TODO add serach indivcatorn when seraching for an item
// TODO make a controller for the FAB for visibility
// TODO change the bidders screen placing bid
// TODO change the size of the profile screen listview "substract the bottom navigation bar"
// TODO make all font responsive 
// TODO del all the SizeConfig.intialize 
// TODO put the stful widgets inside the stful builder and change the whole stful widget into stless for better performace
// TODO change the upcoming auction tiles 
// TODO change the upcoming details auction
// TODO check reponsivness in all devices 
// TODO make the edite profile screen
// TODO make the notifications screen in figma
// TODO make the notification screen in flutter
// TODO learn FCM for the notifications 
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
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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

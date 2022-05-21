// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    Key? key,
    this.name,
    this.description,
  }) : super(key: key);
  final String? name;
  final String? description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(name ?? 'Ipad Pro',
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
        Constants.kSmallVerticalSpacing,
        Row(
          children: [
            Text('Description',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
          ],
        ),
        Constants.kSmallVerticalSpacing,
        Text(
          description ??
              '''Velit mollit sit qui anim quis incididunt reprehenderit eiusmod consequat deserunt. Consectetur aute occaecat velit adipisicing proident nulla esse. Officia aliquip quis laboris adipisicing laborum qui esse aliquip amet. Non reprehenderit est do Lorem non dolor ullamco elit amet in elit esse.

Veniam sunt irure irure ad irure aute velit. Cillum officia incididunt id ullamco officia ut adipisicing elit reprehenderit officia duis incididunt. Laborum ex dolor duis in aliquip laboris ea labore minim voluptate nisi laborum magna.

Ipsum ad esse veniam velit pariatur laboris non cillum cillum dolore reprehenderit culpa excepteur incididunt. Dolor pariatur consectetur id mollit ea tempor. Amet voluptate irure velit enim esse id labore enim. Est veniam veniam est pariatur nostrud labore excepteur mollit elit minim cillum pariatur non. Cupidatat irure veniam sint tempor eu quis anim anim excepteur sit ut adipisicing quis.

Ea ullamco est fugiat aliqua id eu commodo duis. Qui incididunt minim nisi velit tempor do qui fugiat ipsum. Voluptate ipsum Lorem ea Lorem cupidatat cillum proident exercitation do aute eiusmod eiusmod.

Mollit ipsum duis ex ullamco est. Occaecat deserunt voluptate excepteur enim laboris. Cillum do sit est enim velit nostrud tempor. Culpa consequat aliquip Lorem qui esse do cillum magna mollit sunt consectetur sint consectetur dolor.

Quis quis id aute do. Dolor laborum excepteur mollit commodo esse ut ut qui magna. Ex voluptate duis et occaecat occaecat commodo enim laboris magna labore in deserunt.

Officia incididunt ullamco dolore consectetur est dolor dolore excepteur. Irure voluptate exercitation labore est aliqua amet do cupidatat fugiat incididunt sit ex Lorem. Deserunt adipisicing minim ut voluptate Lorem dolore sunt excepteur ipsum eu eu elit nulla officia.

Mollit mollit esse et aliquip velit ad cillum exercitation eiusmod. Nulla magna duis ullamco culpa aliqua consectetur eu. Adipisicing minim laborum laborum do consequat cupidatat proident dolor nostrud voluptate duis.

Aliquip sunt reprehenderit commodo proident. Proident consequat id eu quis aliquip. Nisi in cupidatat sunt nostrud id ea. Fugiat ut labore cupidatat irure irure veniam pariatur. Ad consectetur est et sint. Pariatur quis occaecat cillum commodo culpa qui labore eiusmod reprehenderit tempor adipisicing pariatur. Sunt esse ex ea deserunt occaecat fugiat eu ex sit.

Elit dolor sit consectetur laboris incididunt proident amet proident. Velit eiusmod excepteur esse occaecat eu aute veniam nisi. Sunt magna consequat mollit qui sunt enim nisi mollit pariatur adipisicing reprehenderit eiusmod. Ullamco fugiat amet sint incididunt fugiat excepteur laboris. Irure laborum ea id sint eu. Dolore aute ullamco ex sint eiusmod ad aliquip pariatur. Ea veniam laborum consectetur consectetur commodo.''',
          textAlign: TextAlign.start,
          style:
              TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold),
          maxLines: 10,
          softWrap: true,
        )
      ],
    );
  }
}

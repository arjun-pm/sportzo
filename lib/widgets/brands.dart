import 'package:flutter/material.dart';

class Brands extends StatelessWidget {

String brandimages;
Brands({required this.brandimages});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(image: AssetImage(brandimages)),
    );
  }
}

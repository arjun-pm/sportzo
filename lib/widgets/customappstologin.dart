import 'package:flutter/material.dart';

class Customapps extends StatelessWidget {
  Customapps({required this.customappimages});

  final String customappimages;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 10,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFDADADA), width: 1),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Image(
            image: AssetImage(customappimages),
            height: 40,
          ),
        ));
  }
}

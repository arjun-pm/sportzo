import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportzo/Splash%20Screen/splashscreen.dart';
import 'package:sportzo/views/categorypage.dart';
import 'package:sportzo/views/newarrivalbookingpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      home: Splash(),debugShowCheckedModeBanner: false,
      routes: {
        "NewCategories": (context) => Categories(),
        "Newarrivalbookingpage": (context) => NewarrivalBooking(),
      },
    );
  }
}

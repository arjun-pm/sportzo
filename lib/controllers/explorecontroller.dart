import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ExploreController extends GetxController{

  void gotonext (BuildContext context,Customvariable){
Navigator.of(context).pushNamed("NewCategories", arguments: Customvariable);
  }
  final List<String> quantity = ['1', '2', '3', '4','5' ];

  RxString selectedQuantity = '1'.obs;

}
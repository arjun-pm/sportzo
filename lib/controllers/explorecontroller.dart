import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ExploreController extends GetxController {
  void gotonext(BuildContext context, Customvariable) {
    Navigator.of(context).pushNamed("NewCategories", arguments: Customvariable);
  }

  final List<String> quantity = ['1', '2', '3', '4', '5'];

  RxString selectedQuantity = '1'.obs;

  RxList pumasneakersimg = [
    "assets/images/pumaSneaker1.jpg",
    "assets/images/Pumasneaker2.jpg",
    "assets/images/PumaSneaker3.jpg",
    "assets/images/Pumasneakers4.jpg",

  ].obs;
  RxList pumawearsimg = [
    "assets/images/Pumawear1.jpg",
    "assets/images/Pumawear2.jpg",
    "assets/images/Pumawear3.webp",
    "assets/images/Pumawear4.webp"
  ].obs;

  RxList nikesneakersimg = [
    "assets/images/Nikesneakers1.jpg",
    "assets/images/Nikesneakers2.webp",
    "assets/images/Nikesneakers3.webp",
    "assets/images/Nikesneakers4.webp"
  ].obs;

  RxList nikewearimg = [
    "assets/images/nikewear1.webp",
    "assets/images/nikewear2.png",
    "assets/images/nikewear3.png",
    "assets/images/nikewear4.jpg"
  ].obs;

  RxList adidassneakersimg = [
    "assets/images/adidassneakers1.webp",
    "assets/images/adidassneakers2.webp",
    "assets/images/adidassneakers3.webp",
    "assets/images/adidassneakers4.jpg"
  ].obs;

  RxList adidaswearimg = [
    "assets/images/adidaswear1.webp",
    "assets/images/adidaswear2.webp",
    "assets/images/adidaswear3.jpg",
    "assets/images/adidaswear4.webp"
  ].obs;

  RxList reeboksneakersimg = [
    "assets/images/reeboksneakers1.jpg",
    "assets/images/reeboksneakers2.jpg",
    "assets/images/reeboksneakers3.jpg",
    "assets/images/reeboksneakers4.jpg"
  ].obs;

  RxList reebokwearimg = [
    "assets/images/reebokwears1.webp",
    "assets/images/reebokwears2.webp",
    "assets/images/reebokwears3.webp",
    "assets/images/reebokwears4.webp"
  ].obs;

  RxList filasneakersimg = [
    "assets/images/filasneakers1.jpg",
    "assets/images/filasneakers2.webp",
    "assets/images/filasneakers3.webp",
    "assets/images/filasneakers4.jpg"
  ].obs;

  RxList filawearimg = [
    "assets/images/filawears1.webp",
    "assets/images/filawears2.webp",
    "assets/images/filawears3.webp",
    "assets/images/filawears4.jpg"
  ].obs;
}

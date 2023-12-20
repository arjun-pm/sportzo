import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Addresscontroller extends GetxController{

  // @override
  // void onInit() async {
  //  getAdress();
  //   super.onInit();
  // }
  TextEditingController addnamecontroller = TextEditingController();
  TextEditingController addnumbercontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController pincontroller = TextEditingController();
  TextEditingController placecontroller = TextEditingController();

  SharedPreferences? addressData;


  String? nameadd;
  String? numberadd;
  String? addressadd;
  String? pinadd;
  String? placeadd;

  bool? buttonname = true;

  Future <void> setAddress()async{
    addressData = await SharedPreferences.getInstance();
    String name = addnamecontroller.text;
    String number = addnumbercontroller.text;
    String address = addresscontroller.text;
    String pincode = pincontroller.text;
    String place = placecontroller.text;
    await addressData?.setString("name", name);
    await addressData?.setString("number", number);
    await addressData?.setString("address", address);
    await addressData?.setString("pincode", pincode);
    await addressData?.setString("place", place);
    update();
  }
Future<void>getAdress()async{
    addressData = await SharedPreferences.getInstance();
    nameadd = addressData?.getString("name");
    numberadd = addressData?.getString("number");
    addressadd = addressData?.getString("address");
    pinadd = addressData?.getString("pincode");
    placeadd = addressData?.getString("place");
    update();
}

setAddressButtonname()async{
    addressData = await SharedPreferences.getInstance();
    await addressData?.setBool("buttonname", false);
    update();
}
getAddressButtonname()async{
    addressData = await SharedPreferences.getInstance();
    buttonname = addressData!.getBool("buttonname");
    update();
}


}
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Addresscontroller extends GetxController{

  @override
  void onInit() async {
   getAdress();
   getAddressButtonname();
    super.onInit();
  }
  TextEditingController addnamecontroller = TextEditingController();
  TextEditingController addnumbercontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController pincontroller = TextEditingController();
  TextEditingController placecontroller = TextEditingController();
  SharedPreferences? addressData;


  RxString nameadd = ''.obs;
  RxString numberadd = ''.obs;
  RxString addressadd = ''.obs;
  RxString pinadd = ''.obs;
  RxString placeadd = ''.obs;
  RxBool buttonname = true.obs;

  void setAddress()async{
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
void getAdress()async{
    addressData = await SharedPreferences.getInstance();
    nameadd.value = addressData!.getString("name")!;
    numberadd.value = addressData!.getString("number")!;
    addressadd.value = addressData!.getString("address")!;
    pinadd.value = addressData!.getString("pincode")!;
    placeadd.value = addressData!.getString("place")!;
    update();
}
void setAddressButtonname()async{
    addressData = await SharedPreferences.getInstance();
    await addressData?.setBool("buttonname", false);
    update();
}
void getAddressButtonname()async{
    addressData = await SharedPreferences.getInstance();
    buttonname.value = addressData!.getBool("buttonname")!;
    update();
}

}
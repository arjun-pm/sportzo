
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../views/explorepage.dart';
import '../views/login&signup.dart';

class LoginSignupController extends GetxController {
  RxBool hidepass = true.obs;
  bool? newuserValue;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController confirmpasscontroller = TextEditingController();
  TextEditingController loginemailcontroller = TextEditingController();
  TextEditingController loginpasswordcontroller = TextEditingController();

  SharedPreferences? usersignupdata;

  String? username;
  String? email;
  String? password;

  Future<void> setUser() async {
    usersignupdata = await SharedPreferences.getInstance();
    String username = usernamecontroller.text;
    String email = emailcontroller.text;
    String password = passwordcontroller.text;
    await usersignupdata?.setString("Uname", username);
    await usersignupdata?.setString("Email", email);
    await usersignupdata?.setString("Password", password);
    update();
  }

  Future<void> getUser() async {
    usersignupdata = await SharedPreferences.getInstance();
    username = usersignupdata?.getString("Uname");
    email = usersignupdata?.getString("Email");
    password = usersignupdata?.getString("Password");
    update();
  }

  void getcheckLogin() async{
    usersignupdata = await SharedPreferences.getInstance();
    newuserValue = usersignupdata!.getBool("newUser");
    log(newuserValue.toString()+"isojdg");
    Future.delayed(const Duration(seconds: 3), () {
      if (newuserValue == false) {
        Get.to(() => ExplorePage());
      } else {
        Get.to(() =>  LoginAndSignup());
      }
    });
  }
}

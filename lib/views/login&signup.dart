import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportzo/views/explorepage.dart';
import 'package:sportzo/views/loginpage.dart';
import 'package:sportzo/views/signuppage.dart';

import '../controllers/loginAndsignupcontroller.dart';

class LoginAndSignup extends StatelessWidget {
   LoginAndSignup({Key? key}) : super(key: key);


  final LoginSignupController loginSignupController3 =
  Get.put(LoginSignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 4.6),
          Image(
              image: const AssetImage("assets/images/login&signup.png"),
              height: MediaQuery.of(context).size.height / 2.7),
          SizedBox(height: MediaQuery.of(context).size.height / 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(()=> Login());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E232C),
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: MediaQuery.of(context).size.height / 6.5,
                        vertical: MediaQuery.of(context).size.height / 43),
                  ),
                  child: const Text(" Login  ")),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(()=>Signup());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: MediaQuery.of(context).size.height / 6.5,
                  vertical: MediaQuery.of(context).size.height / 43),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xFF1E232C)),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            child: const Text("Sign Up", style: TextStyle(color: Color(0xFF1E232C))),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 14.5),
          InkWell(
            onTap: (){
              loginSignupController3.username = null;
              Get.to(()=> ExplorePage());
            },
            child: const Text(
              "Continue as guest",
              style: TextStyle(color: Color(0xFF35C2C1), fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}

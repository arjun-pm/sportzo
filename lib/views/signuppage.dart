import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportzo/controllers/loginAndsignupcontroller.dart';
import 'package:sportzo/views/login&signup.dart';

import '../widgets/customappstologin.dart';
import 'loginpage.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);
  final LoginSignupController loginSignupController1 =
      Get.put(LoginSignupController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: InkWell(
              onTap: () {
                Get.to(() => LoginAndSignup());
              },
              child: Container(
                height: 41,
                width: 41,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(width: 2, color: const Color(0xFFE8ECF4))),
                child: const Icon(Icons.arrow_back_ios_new),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Welcome!\nGlad to see you!",
              style: TextStyle(
                  color: Color(0xFF1E232C),
                  fontSize: 35,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                controller: loginSignupController1.usernamecontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFF7F8F9),
                  hintText: "User Name",
                  hintStyle: const TextStyle(color: Color(0xFF8391A1)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Color(0xFFDADADA), width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: Color(0xFFDADADA), width: 1.5)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                controller: loginSignupController1.emailcontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFF7F8F9),
                  hintText: "Email",
                  hintStyle: const TextStyle(color: Color(0xFF8391A1)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Color(0xFFDADADA), width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: Color(0xFFDADADA), width: 1.5)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                controller: loginSignupController1.passwordcontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFF7F8F9),
                  hintText: "Password",
                  hintStyle: const TextStyle(color: Color(0xFF8391A1)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Color(0xFFDADADA), width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: Color(0xFFDADADA), width: 1.5)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                controller: loginSignupController1.confirmpasscontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFF7F8F9),
                  hintText: "Confirm Password",
                  hintStyle: const TextStyle(color: Color(0xFF8391A1)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Color(0xFFDADADA), width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: Color(0xFFDADADA), width: 1.5)),
                )),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  if (loginSignupController1.usernamecontroller.text.isEmpty &&
                      loginSignupController1.emailcontroller.text.isEmpty &&
                      loginSignupController1.passwordcontroller.text.isEmpty &&
                      loginSignupController1
                          .confirmpasscontroller.text.isEmpty) {
                    Get.snackbar("Warning", "Please fill all the fields");
                  } else if (loginSignupController1
                      .usernamecontroller.text.isEmpty) {
                    Get.snackbar("Warning", "Username can't be empty");
                  } else if (loginSignupController1
                      .emailcontroller.text.isEmpty) {
                    Get.snackbar("Warning", "email can't be empty");
                  } else if (loginSignupController1
                      .passwordcontroller.text.isEmpty) {
                    Get.snackbar("Warning", "Password can't be empty");
                  } else if (loginSignupController1.passwordcontroller.text !=
                      loginSignupController1.confirmpasscontroller.text) {
                    Get.snackbar("Warning", "Password Mismatch");
                  } else {
                    loginSignupController1.setUser();

                    Get.to(() => Login());
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E232C),
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: MediaQuery.of(context).size.height / 6.5,
                      vertical: MediaQuery.of(context).size.height / 43),
                ),
                child: const Text(" SignUp ")),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 35),
          const Center(
              child: Text(
            "Or Login with",
            style: TextStyle(
                color: Color(0xFF8391A1), fontWeight: FontWeight.w500),
          )),
          SizedBox(height: MediaQuery.of(context).size.height / 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Customapps(
                customappimages: "assets/images/facebook.png",
              ),
              Customapps(
                customappimages: "assets/images/google.png",
              ),
              Customapps(
                customappimages: "assets/images/apple.png",
              ),
            ],
          ),
        ]),
      )),
    );
  }
}

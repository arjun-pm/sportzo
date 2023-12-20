import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportzo/controllers/loginAndsignupcontroller.dart';
import 'package:sportzo/views/explorepage.dart';
import 'package:sportzo/views/signuppage.dart';

import '../widgets/customappstologin.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final LoginSignupController loginSignupController =
      Get.put(LoginSignupController());

  @override
  Widget build(BuildContext context) {
    loginSignupController.getUser();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 41,
                    width: 41,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            width: 2, color: const Color(0xFFE8ECF4))),
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 15),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Welcome Back!\nGlad to see you,Again!",
                  style: TextStyle(
                      color: Color(0xFF1E232C),
                      fontSize: 35,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: loginSignupController.loginemailcontroller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFF7F8F9),
                      hintText: "Enter your email",
                      hintStyle: const TextStyle(color: Color(0xFF8391A1)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: Color(0xFFDADADA), width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              color: Color(0xFFDADADA), width: 1.5)),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                    ()=>TextFormField(
                      controller: loginSignupController.loginpasswordcontroller,
                      obscureText: loginSignupController.hidepass.value,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFF7F8F9),
                        hintText: "Enter your password",
                        hintStyle: const TextStyle(color: Color(0xFF8391A1)),
                        suffixIcon: IconButton(
                              onPressed: () {
                                loginSignupController.hidepass.value =
                                    !loginSignupController.hidepass.value;
                              },
                              icon: Icon(
                                  loginSignupController.hidepass.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Color(0xFF8391A1))),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              color: Color(0xFFDADADA), width: 1.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: Color(0xFFDADADA), width: 1.5)),
                      )),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 10),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      log(loginSignupController.username.toString() +
                          "u8hiujjjjj");
                      if (loginSignupController
                              .loginemailcontroller.text.isEmpty &&
                          loginSignupController
                              .loginpasswordcontroller.text.isEmpty) {
                        Get.snackbar("Warning", "Please fill all the fields");
                      } else {
                        String emailData =
                            loginSignupController.loginemailcontroller.text;
                        String passwordData =
                            loginSignupController.loginpasswordcontroller.text;
                        if (
                            // emailData.isNotEmpty &&
                            //     passwordData.isNotEmpty &&
                            emailData == loginSignupController.email &&
                                passwordData ==
                                    loginSignupController.password) {
                          loginSignupController.usersignupdata
                              ?.setBool("newUser", false);
                          Get.to(() => ExplorePage());
                        } else {
                          Get.snackbar(
                              "Warning", "Incorrect email or password");
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E232C),
                      padding: EdgeInsetsDirectional.symmetric(
                          horizontal: MediaQuery.of(context).size.height / 6.5,
                          vertical: MediaQuery.of(context).size.height / 43),
                    ),
                    child: const Text(" Login  ")),
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
              SizedBox(height: MediaQuery.of(context).size.height / 20),
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Row(
                  children: [
                    const Text("Don't have an account?",
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                    InkWell(
                      onTap: () {
                        Get.to(() => Signup());
                      },
                      child: const Text("SignUp Now",
                          style: TextStyle(color: Colors.blue, fontSize: 16)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

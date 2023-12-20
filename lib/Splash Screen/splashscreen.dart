import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sportzo/controllers/loginAndsignupcontroller.dart';

class Splash extends StatelessWidget {
  Splash({Key? key}) : super(key: key);
  final LoginSignupController loginSignupController =
      Get.put(LoginSignupController());

  @override
  Widget build(BuildContext context) {
    loginSignupController.getcheckLogin();
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
            child: Text("Sportzo",
                style: GoogleFonts.raleway(fontSize: 50, color: Colors.black))),
        const CupertinoActivityIndicator(
          radius: 15,
        )
      ]),
    );
  }
}

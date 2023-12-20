import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sportzo/Mapvalues/brandvalues.dart';
import 'package:sportzo/Mapvalues/newarrivalsvalues.dart';
import 'package:sportzo/controllers/explorecontroller.dart';
import 'package:sportzo/controllers/loginAndsignupcontroller.dart';
import 'package:sportzo/views/login&signup.dart';
import 'package:sportzo/widgets/brands.dart';
import 'package:sportzo/widgets/carouselslider.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({Key? key}) : super(key: key);
  final ExploreController exploreController1 = Get.put(ExploreController());
  final LoginSignupController loginSignupController2 =
      Get.put(LoginSignupController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          final shouldPop = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Do you want to go back?'),
                actionsAlignment: MainAxisAlignment.spaceBetween,
                actions: [
                  TextButton(
                    onPressed: () {
                      // Navigator.pop(context);
                    },
                    child: const Text('Yes'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Get.back();
                    },
                    child: const Text('No'),
                  ),
                ],
              );
            },
          );
          return shouldPop!;
        },
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              actions: [
                InkWell(
                    onTap: () {
                      loginSignupController2.usersignupdata!
                          .setBool("newUser", true);

                      Get.to(LoginAndSignup());
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.logout,
                        color: Color(0xFF333333),
                      ),
                    ))
              ],
              backgroundColor: Colors.white38,
              elevation: 0,
              iconTheme: const IconThemeData(
                color: Color(0xFF333333),
              ),
            ),
            drawer: Drawer(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: loginSignupController2.username == null
                        ? const Text("Guest", style: TextStyle(fontSize: 17))
                        : Text(loginSignupController2.username!,
                            style: const TextStyle(fontSize: 17)),
                    trailing: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.close,
                        )),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: ElevatedButton(
                      onPressed: () {
                        loginSignupController2.usersignupdata
                            ?.setBool("newUser", true);
                        Get.to(() => LoginAndSignup());
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black87,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13))),
                      child: const Text("Logout"),
                    ),
                  ))
                ],
              ),
            ),
            body: SingleChildScrollView(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 18,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: const Color(0xFFffffff),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 10.0,
                            offset: const Offset(
                              1,
                              3.0,
                            ),
                          )
                        ]),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        hintText: "What are you looking for ?",
                        hintStyle: GoogleFonts.raleway(),
                        prefixIcon: const Icon(
                          Icons.search_outlined,
                          color: Color(0xFF333333),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      cursorColor: const Color(0xFF333333),
                    ),
                  ),
                ),
                const Carousal(),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Brands",
                        style: GoogleFonts.raleway(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "See all",
                        style: GoogleFonts.raleway(
                            fontSize: 18, color: const Color(0xFF379C67)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 9,
                  child: ListView(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: branddetails.map((Customvariable) {
                      return GestureDetector(
                        onTap: () {
                          exploreController1.gotonext(
                              context, Customvariable["Brandimage"]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Image(
                                image: AssetImage(
                                  (Customvariable["Brandimage"]),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 243, top: 8, bottom: 8),
                  child: Text(
                    "New Arrival",
                    style: GoogleFonts.raleway(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                GridView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 250),
                  children: newarrival.map((Customvariable) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed("Newarrivalbookingpage",arguments: Customvariable["image"]);
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height / 3.5,
                          decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              border: Border.all(color: const Color(0xFFD9D9D9))),
                          child: Stack(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height / 5,
                                width: double.infinity,
                                color: Colors.white,
                                child: Image(
                                  image: AssetImage(Customvariable["image"]),
                                ),
                              ),
                              Positioned(
                                  left: 5,
                                  bottom: 50,
                                  child: Text(
                                    Customvariable["name"],
                                    style: GoogleFonts.raleway(
                                      fontSize: 17,
                                    ),
                                  )),
                              Positioned(

                                bottom: 20,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text("Rs:${Customvariable["price"]}/-"),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.height / 12,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.star,color: Colors.black,size: 15),
                                        Text(Customvariable["rating"]),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                )
              ],
            )),
          ),
        ));
  }
}

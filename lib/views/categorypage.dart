import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Mapvalues/brandvalues.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoeimage = ModalRoute.of(context)?.settings.arguments;
    final categoryitems = branddetails
        .firstWhere((element) => element["Brandimage"] == shoeimage);

    return SafeArea(
      child: Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    border:
                        Border.all(width: 2, color: const Color(0xFFE8ECF4))),
                child: const Icon(Icons.arrow_back_ios_new),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.05,
              height: MediaQuery.of(context).size.height / 18,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black54)),
              child: Center(
                child: Text("Choose your category",
                    style: GoogleFonts.raleway(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade500)),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 25,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.height / 4.5,
                  child: Image(
                    image: AssetImage(
                      categoryitems["Shoesimages"],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.height / 4.5,
                  child: Image(
                    image: AssetImage(categoryitems["Sportwearimages"]),
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),Padding(
            padding: const EdgeInsets.only(left:36.0,right:21,top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(categoryitems["Shoes"] ,style: GoogleFonts.raleway(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,),),
                Text(categoryitems["Sportswear"],style: GoogleFonts.raleway(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,),)
              ],
            ),
          ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height / 5,
          //   child: ListView(
          //     shrinkWrap: true,
          //     scrollDirection: Axis.horizontal,
          //     children: branddetails.map((Customvariable) {
          //       return Container(
          //         child: Image(image: AssetImage(Customvariable["Shoesimages"])),
          //       );
          //     }).toList(),
          //   ),
        ]),
      ),
    );
  }
}

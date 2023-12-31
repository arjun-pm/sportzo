import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sportzo/controllers/explorecontroller.dart';
import 'package:sportzo/widgets/newaddress.dart';
import '../controllers/addresscontroller.dart';
import '../Mapvalues/newarrivalsvalues.dart';

class NewarrivalBooking extends StatelessWidget {
  NewarrivalBooking({Key? key}) : super(key: key);

  final ExploreController exploreController2 = Get.put(ExploreController());
  final Addresscontroller addresscontroller = Get.put(Addresscontroller());

  @override
  Widget build(BuildContext context) {
    final itemimage = ModalRoute.of(context)?.settings.arguments;
    final newarrivalitems =
        newarrival.firstWhere((element) => element["image"] == itemimage);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Card(
                  elevation: 2,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                  child: Stack(children: [
                    Center(
                        child: Image(
                      image: AssetImage(newarrivalitems["image"]),
                      height: 260,
                    )),
                    Positioned(
                      left: 15,
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
                    const Positioned(
                      right: 15,
                      child: Icon(
                        Icons.favorite_border_outlined,
                        size: 33,
                        color: Colors.black54,
                      ),
                    )
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      newarrivalitems["name"],
                      style: GoogleFonts.raleway(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.black, size: 20),
                        Text(newarrivalitems["rating"],
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Rs:${newarrivalitems["price"]}/-",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Divider(
                  color: Colors.grey.shade400,
                  thickness: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select Quantity",
                      style: GoogleFonts.raleway(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Obx(
                      () => DropdownButton(
                        value: exploreController2.selectedQuantity.value,
                        items:
                            exploreController2.quantity.map((String quantity) {
                          return DropdownMenuItem(
                            value: quantity,
                            child: Text(quantity),
                          );
                        }).toList(),
                        onChanged: (value) {
                          exploreController2.selectedQuantity.value = value!;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Divider(
                  color: Colors.grey.shade400,
                  thickness: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Address",
                        style: GoogleFonts.raleway(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    Obx(
                      () => Newaddress(
                        buttonname: addresscontroller.buttonname.value == true
                            ? "Add"
                            : "Change",
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => addresscontroller.buttonname.value == false
                    ? Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 5.5,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.shade400, width: 1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(2))),
                          child: Obx(
                            () => Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(addresscontroller.nameadd.value,
                                      style: GoogleFonts.raleway(
                                        fontSize: 17,
                                      )),
                                  Text(addresscontroller.numberadd.value,
                                      style: GoogleFonts.raleway(
                                        fontSize: 17,
                                      )),
                                  Text(addresscontroller.addressadd.value,
                                      style: GoogleFonts.raleway(
                                        fontSize: 17,
                                      )),
                                  Text(addresscontroller.placeadd.value,
                                      style: GoogleFonts.raleway(
                                        fontSize: 17,
                                      )),
                                  Text(addresscontroller.pinadd.value,
                                      style: GoogleFonts.raleway(
                                        fontSize: 17,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            onPressed: () {},
            child: Text("Book Now",
                style: GoogleFonts.raleway(
                    fontSize: 20, fontWeight: FontWeight.w500))),
      ),
    );
  }
}

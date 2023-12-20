import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sportzo/controllers/addresscontroller.dart';
import 'package:sportzo/views/newarrivalbookingpage.dart';

class Newaddress extends StatelessWidget {
  Newaddress({super.key, required this.buttonname});

  final String buttonname;
  final Addresscontroller addresscontroller = Get.put(Addresscontroller());

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: MediaQuery.of(context).size.height / 1.5,
                color: const Color(0xFFE8ECF4),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: addresscontroller.addnamecontroller,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              fillColor: Colors.white,
                              filled: true,
                              labelText: "Name",
                              labelStyle: GoogleFonts.raleway()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: addresscontroller.addnumbercontroller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              fillColor: Colors.white,
                              filled: true,
                              labelText: "Phone Number",
                              labelStyle: GoogleFonts.raleway()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: addresscontroller.addresscontroller,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              fillColor: Colors.white,
                              filled: true,
                              labelText: "Address",
                              labelStyle: GoogleFonts.raleway()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: addresscontroller.pincontroller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              fillColor: Colors.white,
                              filled: true,
                              labelText: "Pin Code",
                              labelStyle: GoogleFonts.raleway()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: addresscontroller.placecontroller,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              fillColor: Colors.white,
                              filled: true,
                              labelText: "State",
                              labelStyle: GoogleFonts.raleway()),
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          onPressed: () {
                            addresscontroller.setAddress();
                            addresscontroller.setAddressButtonname();
                            Get.back();
                          },
                          child: Text(
                            "Use this address",
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Text(buttonname));
  }
}

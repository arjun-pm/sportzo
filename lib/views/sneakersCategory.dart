import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportzo/controllers/explorecontroller.dart';

class Sneakers_category extends StatelessWidget {
  Sneakers_category({Key? key, required this.brands}) : super(key: key);
  final String brands;
  ExploreController exploreController1 = Get.put(ExploreController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                      border:
                          Border.all(width: 2, color: const Color(0xFFE8ECF4))),
                  child: const Icon(Icons.arrow_back_ios_new),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 24),
            Expanded(
              child: GridView.builder(
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,

                    mainAxisSpacing: 20),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
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
                                image: brands == "Puma Sneakers"
                                    ? AssetImage(exploreController1
                                        .pumasneakersimg.value[index])
                                    : brands == "Nike Sneakers"
                                        ? AssetImage(exploreController1
                                            .nikesneakersimg.value[index])
                                        : brands == "Adidas Sneakers"
                                            ? AssetImage(exploreController1
                                                .adidassneakersimg.value[index])
                                            : brands == "Reebok Sneakers"
                                                ? AssetImage(exploreController1
                                                    .reeboksneakersimg
                                                    .value[index])
                                                : AssetImage(exploreController1
                                                    .filasneakersimg
                                                    .value[index])),
                          ),
                          // Positioned(
                          //     left: 5,
                          //     bottom: 50,
                          //     child: Text(
                          //       Customvariable["name"],
                          //       style: GoogleFonts.raleway(
                          //         fontSize: 17,
                          //       ),
                          //     )),
                          // Positioned(
                          //
                          //   bottom: 20,
                          //   child: Row(
                          //     children: [
                          //       Padding(
                          //         padding: const EdgeInsets.only(left: 5),
                          //         child: Text("Rs:${Customvariable["price"]}/-"),
                          //       ),
                          //       SizedBox(
                          //         width: MediaQuery
                          //             .of(context)
                          //             .size
                          //             .height / 12,
                          //       ),
                          //       Row(
                          //         children: [
                          //           const Icon(Icons.star, color: Colors.black, size: 15),
                          //           Text(Customvariable["rating"]),
                          //         ],
                          //       )
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

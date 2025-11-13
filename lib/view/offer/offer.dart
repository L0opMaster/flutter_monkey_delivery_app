import 'dart:convert';
import 'dart:math';
import 'package:delivery_food_app/common/color_extension.dart';
import 'package:delivery_food_app/common_widgets/round_button.dart';
import 'package:delivery_food_app/view/offer/detial_offer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OfferViewState extends StatefulWidget {
  const OfferViewState({super.key});

  @override
  State<OfferViewState> createState() => _OfferViewStateState();
}

class _OfferViewStateState extends State<OfferViewState> {
  List<dynamic> offerObj = [];

  @override
  void initState() {
    super.initState();
    loadingData();
  }

  Future<void> loadingData() async {
    final String response =
        await rootBundle.loadString('assets/data/menu/menu.json');
    final List<dynamic> data = json.decode(response);

    List<dynamic> allItems = [];
    for (var category in data) {
      if (category["items"] != null) {
        allItems.addAll(category["items"]);
      }
    }
    allItems.shuffle(Random());
    setState(() {
      offerObj = allItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Latest Offers',
          style: TextStyle(
            fontSize: media.width * 0.06,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/image/shopping_cart.png',
                width: 25,
                height: 25,
              ),
            ),
          ),
        ],
      ),
      body: offerObj.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Find discounts, Offers special',
                          style: TextStyle(fontSize: 17),
                        ),
                        Text(
                          'meals and more!',
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RoundButton(
                      title: 'Check Offers',
                      onPressed: () {},
                      widget: media.width * 0.5,
                      height: 40,
                      size: 15,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // ✅ Display all items
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: offerObj.length,
                    itemBuilder: (context, index) {
                      var obj = offerObj[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetialOffer(detialitem: obj),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              height: 270,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    obj["image"].toString(),
                                    width: double.infinity,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          obj["name"] ?? "Unnamed Item",
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Icon(Icons.star,
                                                color: TColor.primary,
                                                size: 25),
                                            Text(
                                              obj["rate"]?.toString() ?? "0",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: TColor.primary,
                                              ),
                                            ),
                                            Text(
                                              ' (${obj["rating"]?.toString() ?? "0"})',
                                              style:
                                                  const TextStyle(fontSize: 14),
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              obj["type"]?.toString() ?? "",
                                              style: const TextStyle(
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(width: 7),
                                            const Text('.'),
                                            const SizedBox(width: 7),
                                            Text(
                                              obj["location"]?.toString() ?? "",
                                              style: const TextStyle(
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}

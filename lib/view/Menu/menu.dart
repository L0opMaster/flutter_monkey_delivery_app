import 'dart:convert';

import 'package:delivery_food_app/common/color_extension.dart';
import 'package:delivery_food_app/common_widgets/round_textfield.dart';
import 'package:delivery_food_app/view/Menu/menu_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// I commented out TColor since it's undefined here,
// you can replace these colors with your own color variables or imports.
// import 'package:delivery_food_app/common/color_extension.dart';

class MenuViwState extends StatefulWidget {
  const MenuViwState({super.key});

  @override
  State<MenuViwState> createState() => _MenuViwStateState();
}

class _MenuViwStateState extends State<MenuViwState> {
  final TextEditingController searchMenu = TextEditingController();
  List<dynamic> menuArry = [];
  @override
  void initState(){
    super.initState();
    loadingMenuData();
  }
  Future<void> loadingMenuData() async{
    final String response = await rootBundle.loadString('assets/data/menu/menu.json');
    final List<dynamic> data = json.decode(response);
    
    setState(() {
      menuArry = data;
    });
  }
  @override
  Widget build(BuildContext context) {
    // Define media size here
    final media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Menu',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: media.width * 0.06,
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold, // or FontWeight.w600
            ),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: RoundTextfield(
                fontSize: 15,
                lefticon: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    width: 40,
                    height: 20,
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'assets/image/search.png',
                      width: 20,
                      height: 20,
                    )
                  ),
                ),
                controller: searchMenu,
                hintText: 'Search Food',
                obscureText: false
              ),
            ),
            SizedBox(height: 30),
            
            Stack(
              children: [
                Container(
                  // margin: EdgeInsets.only(top: 20),
                  height: media.height - 370,
                  width: 110,
                  decoration: BoxDecoration(
                    color: TColor.primary,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      bottomRight: Radius.circular(40)
                    )
                  ),
                ),
                ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: menuArry.length,
                itemBuilder: ((context, index) {
                  var mObj = menuArry[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MenuListView(
                            title: mObj["name"].toString(),
                            items:mObj["items"],
                          ),
                        ),
                      );
                    },
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        // SizedBox(height: 20),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, bottom: 20, right: 20),
                          width: media.width - 100,
                          height: 100,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(35),
                                  bottomLeft: Radius.circular(35),
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 7,
                                    offset: Offset(0, 4))
                              ]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              mObj["image"].toString(),
                              width: 80,
                              height: 80,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    mObj["name"].toString(),
                                    style: TextStyle(
                                        color: TColor.primaryText,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "${mObj["item_count"].toString()} items",
                                    style: TextStyle(
                                        color: TColor.secondarytext,
                                        fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(17.5),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 4,
                                        offset: Offset(0, 2))
                                  ]),
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/image/btn_next.png",
                                width: 15,
                                height: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                })),
              ]
            )
            // Add more widgets here as needed
            // SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}

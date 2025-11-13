// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:delivery_food_app/common/color_extension.dart';
import 'package:delivery_food_app/common_widgets/round_textfield.dart';
import 'package:delivery_food_app/view/Menu/items_detial.dart';

class MenuListView extends StatefulWidget {
  final String title;
  final List<dynamic> items;


  const MenuListView({
    super.key,
    required this.title, required this.items,
  });

  @override
  State<MenuListView> createState() => _MenuListViewState();
}

class _MenuListViewState extends State<MenuListView> {
  final TextEditingController controller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: TColor.primary,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: TColor.primary,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            widget.title,
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
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 25),
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
                controller: controller,
                hintText: 'Search Food',
                obscureText: false
              ),
            ),
            ListView.builder(
              itemCount: widget.items.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                var obj = widget.items[index] as Map<String, dynamic>;
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => ItemsDetial(detialitem: widget.items[index])));
                  },
                  child: SizedBox(
                    child: Container(
                      width: double.infinity,
                      // height: media.height * 0.3,
                      margin: EdgeInsets.only(bottom:  5),
                      color: Colors.amberAccent,
                      child: Stack(
                        children: [
                          Image.asset(
                            obj["image"],
                            width: double.infinity,
                            height: media.height * 0.23,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 50,
                            left: 20,
                            child: Text(
                              obj["name"].toString(),
                              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                letterSpacing: -0.3,
                              ),
                            )
                          ),
                          Positioned(
                            bottom: 25,
                            left: 20,
                            child: Row(
                              children: [
                                const Icon(Icons.star, color: Colors.orange, size: 16),
                                Text(
                                  obj["rate"].toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  obj["location"].toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  ' • ',
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.white,
                                    fontSize: 14
                                  ),
                                ),
                                Text(
                                  obj["restaurant"].toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ) 
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
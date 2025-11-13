import 'dart:convert';

import 'package:delivery_food_app/common/color_extension.dart';
import 'package:delivery_food_app/common_widgets/list_view.dart';
import 'package:delivery_food_app/common_widgets/round_textfield.dart';
import 'package:delivery_food_app/view/home/list_cart_arry.dart';
import 'package:delivery_food_app/view/login/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeState();
}

class _HomeState extends State<HomeView> {
  TextEditingController searchController = TextEditingController();
  List<dynamic> listHomeBar = [];

  @override
  void initState(){
    super.initState();
    loadDataJson();
  }
  Future<dynamic> loadDataJson() async{
    final String responce = await rootBundle.loadString('assets/data/menu/specific.json');
    final List<dynamic> data = json.decode(responce);

    setState(() {
      listHomeBar = data;
    });
  }

  final List<Map<String, String>> popuArry = [
    {
      "image": "assets/image/res_1.png",
      "star": "assets/image/rate.png",
      "title": "Minute by Tuk Tuk",
      "rate": "4.8",
      "rating": "1,245 ratings",
      "type": "Casual Dining",
      "location": "Colombo 05",
    },
    {
      "image": "assets/image/res_2.png",
      "title": "Café de Noir",
      "star": "assets/image/rate.png",
      "rate": "4.6",
      "rating": "980 ratings",
      "type": "Coffee & Snacks",
      "location": "Nugegoda",
    },
    {
      "image": "assets/image/res_3.png",
      "star": "assets/image/rate.png",
      "title": "Bakes by Tella",
      "rate": "4.9",
      "rating": "1,562 ratings",
      "type": "Bakery & Desserts",
      "location": "Kollupitiya",
    },
  ];

  final List<Map<String, String>> mostPopuArry = [
    {
      "image": "assets/image/res_1.png",
      "title": "Minute by Tuk Tuk",
      "star": "assets/image/rate.png",
      "rate": "4.7",
      "rating": "1,245 ratings",
      "type": "Casual Dining",
      "location": "Colombo 05",
    },
    {
      "image": "assets/image/res_2.png",
      "star": "assets/image/rate.png",
      "title": "Café de Noir",
      "rate": "4.2",
      "rating": "980 ratings",
      "type": "Coffee & Snacks",
      "location": "Nugegoda",
    },
    {
      "image": "assets/image/m_res_2.png",
      "star": "assets/image/rate.png",
      "title": "ShanWich",
      "rate": "4.9",
      "rating": "980 ratings",
      "type": "Coffee & Snacks",
      "location": "Nugegoda",
    },
  ];

  final List<Map<String, String>> reArry = [
    {
      "image": "assets/image/item_1.png",
      "star": "assets/image/rate.png",
      "title": "Minute by Tuk Tuk",
      "rate": "4.8",
      "rating": "1,245 ratings",
      "type": "Casual Dining",
      "location": "Colombo 05",
    },
    {
      "image": "assets/image/item_3.png",
      "star": "assets/image/rate.png",
      "title": "Pizza Rush Hour",
      "rate": "4.7",
      "rating": "890 ratings",
      "type": "Pizza & Fast Food",
      "location": "Bambalapitiya",
    },
    {
      "image": "assets/image/item_2.png",
      "star": "assets/image/rate.png",
      "title": "Barita",
      "rate": "4.5",
      "rating": "1,050 ratings",
      "type": "Bar & Lounge",
      "location": "Dehiwala",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Good morning Luki Yara!',
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
                  )),
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Delivering to',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: media.width * 0.025,
                      color: TColor.secondarytext,
                    ),
                  ),
                  SizedBox(height: 4),
                  _CurrentLocation(media),
                  _SearchBar(),
                  const SizedBox(width: 20),
                  _ListCartArry(),
                  // SizedBox(height: 5),
                ],
              ),
            ),
            // _listPopularRestaurant(),
            // ListViewObj(
            //   objA: popuArry,
            //   title: 'Popular Restaurants',
            //   onPressed: () {
                
            //   },
            //   isPopu: true,
            // ),
            
            ListViewObj(
              isPopu: true,
              objA: popuArry, 
              title: 'Popular Restaurents', 
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> WelcomeScreen()));
              }
            ),
            ListViewObj(
              isMostpopu: true,
              objM: mostPopuArry, 
              title: 'Most Popular', 
              onPressed: (){
                
              }
            ),
            SizedBox(height: 20,),
            ListViewObj(
              title: 'Recent Item',
              isRecent: true,
              objC: reArry, 
              onPressed: (){})
          ],
        ),
      ),
    );
  }


  SizedBox _ListCartArry() {
    return SizedBox(
      height: 136,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listHomeBar.length,
          itemBuilder: (context, index) {
            var objcateArry = listHomeBar[index] as Map<String, dynamic> ;
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListCartArry(
                    listCart: objcateArry["items"],
                    name: objcateArry["name"],
                  )
                  )
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          objcateArry["image"].toString(),
                          width: 100,
                          height: 100,
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      objcateArry["name"].toString(),
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Padding _SearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
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
                )),
          ),
          controller: searchController,
          hintText: 'Search Food',
          obscureText: false),
    );
  }

Row _CurrentLocation(var media) {
  return Row(
    children: [
      Text(
        'Current Location',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: media.width * 0.041,
            color: TColor.secondarytext,
          ),
        ),
      SizedBox(width: 20),
      Image.asset(
        'assets/image/dropdown.png',
        width: 14,
        height: 14,
      ),
    ],
    );
  }
}
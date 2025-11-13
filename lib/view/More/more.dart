import 'package:delivery_food_app/common_widgets/more_list.dart';
import 'package:delivery_food_app/view/More/about_us.dart';
import 'package:delivery_food_app/view/More/inbox.dart';
import 'package:delivery_food_app/view/More/my_orders.dart';
import 'package:delivery_food_app/view/More/notification.dart';
import 'package:delivery_food_app/view/More/Payment/payment.dart';
import 'package:flutter/material.dart';

class MoreState extends StatefulWidget {
  const MoreState({super.key});

  @override
  State<MoreState> createState() => _MoreSStateState();
}

class _MoreSStateState extends State<MoreState> {
  final List<Map<String, String>> morelist = [
    {
      "image" : "assets/image/more_payment.png",
      "title" : "Payment Detials",
    },
    {
      "image" : "assets/image/tab_offer.png",
      "title" : "My Orders",
    },
    {
      "image" : "assets/image/more_notification.png",
      "title" : "Notifications",
    },
    {
      "image" : "assets/image/more_inbox.png",
      "title" : "Inbox",
    },
    {
      "image" : "assets/image/more_info.png",
      "title" : "About Us",
    },
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'More',
          style: TextStyle(
            fontSize: media.width * 0.06,
            fontWeight: FontWeight.bold
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            ListView.builder(
              itemCount: morelist.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var obj = morelist[index];
                return Column(
                  children: [
                    MoreList(
                      controller: () {
                        if (index == 0) {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => Payment())
                        );
                        
                        } else if(index == 1){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => MyOrders())
                          );
                        } else if (index == 2){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => NotificationV())
                          );
                        } else if (index == 3){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => Inbox())
                          );
                        } else{
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => AboutUs())
                          );
                        }
                        // Navigator.push(
                        //   context, 
                        //   MaterialPageRoute(builder: (context) => )
                        // );
                      }, 
                      image: obj["image"].toString(), 
                      title: obj["title"].toString(),
                    ),
                  ],
                );
              },
            )
          ],
        ), 
      ),
    );
  }
}
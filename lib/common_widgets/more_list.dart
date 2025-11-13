import 'package:delivery_food_app/common/color_extension.dart';
import 'package:flutter/material.dart';

class MoreList extends StatelessWidget {
  final VoidCallback controller;
  final String image;
  final String title;
  const MoreList({super.key, required this.controller, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return InkWell(
      onTap: controller,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          // SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(
                top: 10, bottom: 20, right: 20),
            width: media.width - 50,
            height: 100,
            decoration: const BoxDecoration(
                color: Color(0xFFE7E7E7),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
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
              
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      alignment: Alignment.center,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(215, 199, 199, 199),
                      ),
                      child: Image.asset(
                        image,
                        width: 40,
                        height: 40,
                        color: const Color(0xFF000000),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          color: TColor.secondarytext,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 35,
                height: 35,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    color: Color(0xFFE7E7E7),
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
                  "assets/image/btn_next.png",color: Colors.black,
                  width: 15,
                  height: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
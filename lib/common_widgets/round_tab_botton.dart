// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delivery_food_app/common/color_extension.dart';
import 'package:flutter/material.dart';

class RoundTabBotton extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSlct;
  final VoidCallback onTap;
  const RoundTabBotton({
    Key? key,
    required this.title,
    required this.icon,
    required this.isSlct,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,      
      child: Column(
        children: [
          // SizedBox(height: 10),
          Image.asset(
            icon,
            height: isSlct ? 25 : 20,
            width: isSlct ? 25 : 20,
            color: isSlct ? TColor.primary : TColor.placeholder,
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontSize: isSlct ? 14 : 12,
              color: isSlct ? TColor.primary : TColor.placeholder,
            ),
          )
        ],
      ),
    );
  }
}

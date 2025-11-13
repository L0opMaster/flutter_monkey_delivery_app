import 'package:delivery_food_app/common/color_extension.dart';
import 'package:flutter/material.dart';

class RoundManuTabButton extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelected;
  final VoidCallback onTab;
  const RoundManuTabButton({super.key, required this.title, required this.icon, required this.isSelected, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            width: isSelected ? 20 : 15,
            height: isSelected ? 20 : 15,
            color: isSelected ? TColor.primary : Colors.grey,
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: isSelected ? 12 : 10,
              fontWeight: FontWeight.w500,
              color: isSelected ? TColor.primary : Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
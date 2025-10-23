import 'package:delivery_food_app/common/color_extension.dart';
import 'package:flutter/material.dart';

enum RoundButtonType{
  backgroundColor,
  textPrimary,
}

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final RoundButtonType type ;
  final double ? height;
  
  const RoundButton({
    super.key, 
    required this.title, 
    required this.onPressed,
    this.type =  RoundButtonType.backgroundColor,
    this.height = 60
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: type == RoundButtonType.backgroundColor ? TColor.primary : TColor.transparent,
          border: Border.all(
            color: type == RoundButtonType.backgroundColor ? TColor.primary : TColor.primary,
            width: 2
          )
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: type == RoundButtonType.backgroundColor ? TColor.textfield : TColor.primary
          ),
        ),
      ),
    );
  }
}
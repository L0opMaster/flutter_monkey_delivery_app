import 'package:delivery_food_app/common/color_extension.dart';
import 'package:flutter/material.dart';

enum RoundButtonType{
  backgroundPrimary, 
  textPrimary,
}

class RoundButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final RoundButtonType type;
  const RoundButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.type = RoundButtonType.backgroundPrimary
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 60,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: type == RoundButtonType.backgroundPrimary ? TColor.primary : TColor.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: type == RoundButtonType.textPrimary ? TColor.primary : TColor.placeholder,
            width: 2
          )
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 17,
            color: type ==  RoundButtonType.textPrimary ? TColor.primary : TColor.textfield,
            fontWeight: FontWeight.w600
          ),
        )
      ),
    );
  }
}
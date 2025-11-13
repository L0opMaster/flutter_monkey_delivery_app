import 'package:delivery_food_app/common/color_extension.dart';
import 'package:flutter/material.dart';
enum RoundBackgroundType{
  backgroundColor,
  noneBackgroundColor

}
class RoundButtonIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Image icon;
  final double height;
  final RoundBackgroundType colortype;
  const RoundButtonIcon({super.key, required this.onPressed, required this.title, required this.icon, this.colortype = RoundBackgroundType.backgroundColor,  this.height = 65});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colortype == RoundBackgroundType.backgroundColor ? Colors.blue : TColor.primary,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: TColor.textfield
              ),
            ),
          ],
        ),
      ),
  );
  }
}
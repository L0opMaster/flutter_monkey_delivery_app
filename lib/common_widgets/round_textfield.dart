import 'package:delivery_food_app/common/color_extension.dart';
import 'package:flutter/material.dart';

class RoundTextfield extends StatelessWidget {
  final TextEditingController ? controller;
  final String hintText;
  final TextInputType ? keybordTyoe;
  final bool obscureText;
  final double ? width;
  final BorderRadiusGeometry borderRadius ;
  final double fontSize;
  final TextAlign alignment;
  final bool ? padding;
  const RoundTextfield({
    super.key, 
    this.padding = true,
    this.controller, 
    required this.hintText,  
    this.keybordTyoe, 
    required this.obscureText, 
    this.width,
    this.fontSize = 14,
    this.alignment = TextAlign.start,
    this.borderRadius = const BorderRadius.all(Radius.circular(30))
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: width,
      alignment: Alignment.centerLeft,
      decoration:BoxDecoration(
        borderRadius: borderRadius,
        color: TColor.textfield
      ),
      child: TextField(
        textAlign: alignment,
        autocorrect: false,
        controller: controller,
        keyboardType: keybordTyoe,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: padding == true ? EdgeInsets.symmetric(horizontal: 30, vertical: 8) : null,
    //     enabledBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.blue, width: 2.0),
        // ),
        enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: TColor.secondarytext,
          ),
        ),
      
      ),
    );
  }
}
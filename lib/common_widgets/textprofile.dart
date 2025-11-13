import 'package:delivery_food_app/common/color_extension.dart';
import 'package:flutter/material.dart';

class Textprofile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool hidetext;
  final TextEditingController? controller;
  const Textprofile({super.key, required this.title, required this.subtitle, required this.hidetext, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
                decoration: BoxDecoration(
                  color: TColor.placeholder,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, top: 6, bottom: 0),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                    TextField(
                      controller: controller,
                      autocorrect: hidetext,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        isDense: true, // ✅ makes the field more compact
                        contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                        hintText: subtitle,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: TColor.secondarytext,
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }
}
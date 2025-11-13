import 'package:delivery_food_app/common/color_extension.dart';
import 'package:delivery_food_app/common_widgets/most_popular_restaurants.dart';
import 'package:delivery_food_app/common_widgets/populal_restautants.dart';
import 'package:delivery_food_app/common_widgets/recent_item.dart';
import 'package:flutter/material.dart';

class ListViewObj extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final List ?objA;
  final List ?objM;
  final List ?objC;
  final bool ? isPopu;
  final bool ? isRecent;
  final bool ? isMostpopu;
  const ListViewObj({super.key, this.objA, required this.title, required this.onPressed, this.isRecent, this.isMostpopu, this.isPopu, this.objM, this.objC});

  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 10),
      // Header row
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: TColor.primaryText,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextButton(
              onPressed: (){},
              child: Text(
                'View all',
                style: TextStyle(
                  fontSize: 13,
                  color: TColor.primary,
                  fontWeight: FontWeight.bold,
                ),
              )
            ),
          ],
        ),
      ),
      SizedBox(height: 10),
      if (isMostpopu == true)
        MostPopularRestaurants(objM: objM ?? [], onPressed: onPressed,),
    
      if (isPopu == true)
        PopulalRestautants(objP: objA ?? [], onPressed: onPressed,),
    
      
    
      if (isRecent == true)
        RecentItem(objC: objC ?? [], onPressed: onPressed)
      
    ],
        );
  }
}

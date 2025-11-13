import 'package:delivery_food_app/common/color_extension.dart';
import 'package:flutter/material.dart';

class MostPopularRestaurants extends StatelessWidget {
  final VoidCallback onPressed;
  final List objM;
  const MostPopularRestaurants({super.key, required this.objM, required this.onPressed});
// Restaurant list (full width, vertical scroll)
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 220,  // Adjust height to fit image + text nicely
            child: ListView.builder(
              itemCount: objM.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var objPopuArry = objM[index];
                return Container(
                  width: 250, // fixed width per item, adjust as needed
                  margin: const EdgeInsets.only(right: 15), // horizontal spacing between items
                  color: const Color.fromARGB(255, 245, 244, 244),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(         
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.circular(8), // optional rounded corners
                        child: Image.asset(
                          objPopuArry["image"].toString(),
                          width: 250,
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
          
                      const SizedBox(height: 8),
          
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              objPopuArry["title"].toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: TColor.primaryText,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                
                                const SizedBox(width: 4),
                                Text(
                                  objPopuArry["type"].toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  objPopuArry["location"].toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                // const Icon(Icons.star, color: Colors.orange, size: 16),
                                Image.asset(
                                  objPopuArry["star"].toString(),
                                  width: 11,
                                  height: 11,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  objPopuArry["rate"].toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );

  }
}
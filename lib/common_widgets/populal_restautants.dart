import 'package:delivery_food_app/common/color_extension.dart';
import 'package:flutter/material.dart';

class PopulalRestautants extends StatelessWidget {
  final List objP;
  final VoidCallback onPressed;
  const PopulalRestautants({super.key, required this.objP, required this.onPressed});
// Restaurant list (full width, vertical scroll)
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListView.builder(
        itemCount: objP.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var objPopuArry = objP[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 25),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ Full-width Image
                ClipRRect(
                  borderRadius: BorderRadius.zero,
                  child: Image.asset(
                    objPopuArry["image"].toString(),
                    width: MediaQuery.of(context).size.width, // full width
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
      
                const SizedBox(height: 8),
                // ✅ Text content with padding
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        objPopuArry["title"].toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: TColor.primaryText,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
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
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '(${objPopuArry["rating"]})',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            objPopuArry["type"].toString(),
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Text('•'),
                          const SizedBox(width: 4),
                          Text(
                            objPopuArry["location"].toString(),
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade700,
                            ),
                          ),
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
    );
  }
}
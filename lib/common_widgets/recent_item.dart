import 'package:flutter/material.dart';

class RecentItem extends StatelessWidget {
  final List objC;
  final VoidCallback onPressed;

  const RecentItem({
    super.key,
    required this.objC,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListView.builder(
        itemCount: objC.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var objPopuArry = objC[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 25),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ✅ Image
                      ClipRRect(
                        borderRadius: BorderRadius.zero,
                        child: Image.asset(
                          objPopuArry["image"].toString(),
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.width * 0.25,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // ✅ Text Section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ✅ Restaurant title (bigger & bold)
                            Text(
                              objPopuArry["title"].toString(),
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.onSurface,
                                letterSpacing: -0.3,
                              ),
                            ),
                            const SizedBox(height: 6),

                            // ✅ Subtitle (type + location)
                            Row(
                              children: [
                                Text(
                                  objPopuArry["type"].toString(),
                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade700,
                                      ),
                                ),
                                const SizedBox(width: 4),
                                const Text('•'),
                                const SizedBox(width: 4),
                                Text(
                                  objPopuArry["location"].toString(),
                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade600,
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),

                            // ✅ Rating row
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
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        fontSize: 13,
                                        color: Colors.grey.shade600,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

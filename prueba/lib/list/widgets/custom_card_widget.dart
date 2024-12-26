import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget(
      {super.key,
      required this.title,
      required this.category,
      required this.imageUrl,
      required this.price});

  final String title;
  final String category;
  final String price;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 328.0,
      height: 125.0,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),

          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 1.0,
                    ),
                    Text(
                      category,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 1.0,
                    ),
                    Row(
                      children: [
                        Text(
                          price,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 1.0,
                        ),
                        const Text(
                          'Precio sugerido',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),

                 Padding(padding: EdgeInsets.only(right: 10.0),child: ClipRRect(
                   borderRadius: BorderRadius.circular(8.0),
                   child: Image.asset(
                     imageUrl,
                     width: 85.0,
                     height: 85.0,
                     fit: BoxFit.cover,
                   ),
                 ),)


              ],
            ),
            // Expanded(child:

            // ),
          ],
        ),

      ),
    );
  }
}

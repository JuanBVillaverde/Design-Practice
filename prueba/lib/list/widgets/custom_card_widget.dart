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
    final screen = MediaQuery.of(context).size.width;
    if (screen >= 1200) {
      return Container(
        width: 240,
        height: 348,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageUrl,
                width: double.infinity,
                height: 240.0,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    category,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4.0),
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
            ),
          ],
        ),
      );
    } else {
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
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Flexible(
                      child: Text(
                        category,
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            price,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        const Flexible(
                          child: Text(
                            'Precio sugerido',
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imageUrl,
                  width: 85.0,
                  height: 85.0,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}

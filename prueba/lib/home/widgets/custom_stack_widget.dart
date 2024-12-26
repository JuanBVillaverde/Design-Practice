import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomStackWidget extends StatelessWidget {
  final String backgroundImage;
  final String title;
  final String subtitle;
  // final VoidCallback? onTap;
  final Color colorGradient;
  // String? imagePath;
  // String? title;
  // String? description;

  CustomStackWidget({
    Key? key,
    required this.backgroundImage,
    required this.title,
    required this.subtitle,
    // this.onTap,
    required this.colorGradient,
  }) : super(key: key);

  // {required this.imagePath,
  // required this.description,
  // required this.title,
  // super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      // onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Container(
          width: screenWidth * 0.9,
          height: screenWidth * 0.4,
          decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: NetworkImage(backgroundImage),
            //   fit: BoxFit.cover,
            // ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              ClipRRect(
                child: SizedBox.expand(
                  child: Image.asset(
                    backgroundImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      colorGradient.withOpacity(1.0),
                      colorGradient.withOpacity(0.1),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 16,
                right: 16,
                child: Container(
                  width: screenWidth * 0.1,
                  height: screenWidth * 0.1,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

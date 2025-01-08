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
    final screenWidth = MediaQuery.sizeOf(context).width;
    final double height;
    if(screenWidth>=1024){
      height=180.0;
    }
    else{
      height = screenWidth*0.4;
    }
        // MediaQuery.of(context).size.width;

    return GestureDetector(
      // onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 9.0),
        // child: LayoutBuilder( builder: (context, constraints){
          // double containerWidth = constraints.maxWidth;
          // double containerHeight = constraints.maxHeight;
          // double buttonSize= containerWidth*0.1;
          //  return
          child: Container(
            width: screenWidth * 0.9,
            height: height,
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                    child: SizedBox.expand(
                      child: Image.asset(
                        backgroundImage,
                        // width: double.infinity,
                        // height: double.infinity,
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
                      Padding(
                        padding: const EdgeInsets.only(right: 95.0),
                        child: Expanded(
                          child: Text(
                            subtitle,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.visible,
                            softWrap: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: Container(
                    width: 31,
                    height: 31,
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
  // }
        ),
      // ),
    );
  }
}

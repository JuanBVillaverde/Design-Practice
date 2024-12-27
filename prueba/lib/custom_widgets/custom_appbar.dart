import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const CustomAppbar({this.height = kToolbarHeight, super.key});

  @override


  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;



    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          const Spacer(),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Puntos',
                      style: TextStyle(fontSize: 14.0, color: Colors.grey),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      '500',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8.0),
                Icon(
                  Icons.emoji_events,
                  color: Colors.amber,
                  size: 24.0,
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
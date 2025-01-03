import 'package:flutter/material.dart';

class CustomSearchbar extends StatelessWidget {
  const CustomSearchbar(
      {super.key,
      required this.controller,
      this.onFilterPressed,
      required this.text});

  final String text;
  final TextEditingController controller;
  final VoidCallback? onFilterPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: text,
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: onFilterPressed,
            icon: const Icon(
              Icons.tune,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

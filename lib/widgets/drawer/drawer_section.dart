import 'package:flutter/material.dart';

class DrawerSection extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry? padding;

  const DrawerSection({
    super.key,
    required this.title,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsets.only(
            left: 18,
            top: 8,
            bottom: 4,
          ),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.3,
          fontSize: 11,
        ),
      ),
    );
  }
}
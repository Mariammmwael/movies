import 'package:flutter/material.dart';

Widget buildFlagButton(
  String assetPath, {
  required bool isSelected,
  required VoidCallback onTap,
  required Locale setLocale,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 36,
      height: 36,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? const Color(0xFFFFC107) : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: ClipOval(child: Image.asset(assetPath, fit: BoxFit.cover)),
    ),
  );
}

import 'package:flutter/material.dart';

Widget labelField(String string, IconData icon) {
  return Row(
    children: [
      Icon(
        icon,
        color: const Color(0xFFA2ADBA),
        size: 15,
      ),
      const SizedBox(width: 5),
      Text(
        string,
        style: const TextStyle(
          color: Color(0xFF7e8ba2),
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
      ),
    ],
  );
}

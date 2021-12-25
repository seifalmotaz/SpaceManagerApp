import 'package:flutter/material.dart';

Widget labelField(String string, IconData icon) {
  return Row(
    children: [
      Icon(
        icon,
        color: Colors.grey,
        size: 17,
      ),
      const SizedBox(width: 5),
      Text(
        string,
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
    ],
  );
}

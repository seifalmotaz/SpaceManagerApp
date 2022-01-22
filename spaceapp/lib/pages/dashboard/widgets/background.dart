import 'dart:ui';

import 'package:flutter/material.dart';

class DashboardBackground extends StatelessWidget {
  const DashboardBackground(this.child, {Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: 3,
              sigmaY: 3,
            ),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/backgrounds/bg.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.white70,
                    BlendMode.dstATop,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox.expand(child: child),
      ],
    );
  }
}

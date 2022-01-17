import 'dart:ui';

import 'package:flutter/material.dart';

class DashboardBackground extends StatelessWidget {
  const DashboardBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(
          sigmaX: 3,
          sigmaY: 3,
        ),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/backgrounds/bg.jpg'),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                Colors.white70,
                BlendMode.dstATop,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

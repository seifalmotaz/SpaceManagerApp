import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:spaceapp/widgets/xwidgets.dart';

class WScaffold extends StatelessWidget {
  const WScaffold({
    Key? key,
    required this.title,
    required this.child,
    this.leading,
    this.trailing,
    this.floatingActionButton,
  }) : super(key: key);

  final String title;
  final Widget child;
  final List<WIconButton>? leading;
  final List<WIconButton>? trailing;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      body: Stack(
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
          WTopBar(
            title: title,
            leading: leading,
            trailing: trailing,
          ),
        ],
      ),
    );
  }
}

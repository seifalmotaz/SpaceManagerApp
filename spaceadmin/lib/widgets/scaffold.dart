import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:spaceadmin/widgets/responsive.dart';

class WScaffold extends Responsiveless {
  const WScaffold({
    Key? key,
    required this.title,
    required this.child,
    this.actions,
    this.floatingActionButton,
  }) : super(key: key);

  final String title;
  final Widget child;
  final Widget? floatingActionButton;
  final List<Widget>? actions;

  @override
  Widget xBuild(BuildContext context, size) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      body: Stack(
        children: [
          SizedBox.expand(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
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
          WAppBar(title: title, actions: actions),
        ],
      ),
    );
  }
}

class WAppBar extends Responsiveless {
  const WAppBar({
    Key? key,
    this.actions,
    required this.title,
  }) : super(key: key);

  final String title;
  final List<Widget>? actions;

  @override
  Widget xBuild(BuildContext context, Size size) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 13),
        child: SizedBox(
          width: size.width * .97,
          height: kToolbarHeight,
          child: AppBar(
            elevation: 1,
            primary: false,
            titleSpacing: 0,
            actions: actions,
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
          ),
        ),
      ),
    );
  }
}

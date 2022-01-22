import 'package:flutter/material.dart';
import 'package:ui_responsive/constant.dart';

class UIDesktop extends StatelessWidget {
  const UIDesktop({
    Key? key,
    this.x5large,
    this.large,
    this.medium,
    this.x3large,
    this.x4large,
    this.xlarge,
    this.xmedium,
    this.xxlarge,
  }) : super(key: key);

  final Function(Size size)? x5large;
  final Function(Size size)? x4large;
  final Function(Size size)? x3large;
  final Function(Size size)? xxlarge;
  final Function(Size size)? xlarge;
  final Function(Size size)? large;
  final Function(Size size)? medium;
  final Function(Size size)? xmedium;

  bool get _x5large => x5large == null;
  bool get _x4large => x4large == null;
  bool get _x3large => x3large == null;
  bool get _xxlarge => xxlarge == null;
  bool get _xlarge => xlarge == null;
  bool get _large => large == null;
  bool get _medium => medium == null;
  bool get _xmedium => xmedium == null;

  Function(Size size) executeBuild(String key, Size size) {
    switch (key) {
      case '5xlarge':
        if (_x5large) return x5large!;
        break;
      case '4xlarge':
        if (_x4large) return x4large!;
        break;
      case '3xlarge':
        if (_x3large) return x3large!;
        break;
      case 'xxlarge':
        if (_xxlarge) return xxlarge!;
        break;
      case 'xlarge':
        if (_xlarge) return xlarge!;
        break;
      case 'large':
        if (_large) return large!;
        break;
      case 'medium':
        if (_medium) return medium!;
        break;
      case 'xmedium':
        if (_xmedium) return xmedium!;
    }
    return (x5large ??
        x4large ??
        x3large ??
        xxlarge ??
        xlarge ??
        large ??
        medium ??
        xmedium)!;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.of(context).size;
        Map screens = PlatformData.screens['desktop'];
        List screenKeys = screens.keys.toList();
        List screenValues = screens.values.toList();

        for (var i = 0; i < screenValues.length; i++) {
          String key = screenKeys[i] as String;
          Size screen = screenValues[i] as Size;
          if (i == 0) {
            if (size.width >= screen.width) {
              return executeBuild(key, size)(size);
            }
          } else {
            if (size.width >= screenValues[i - 1].size &&
                size.width >= screen.width) {
              return executeBuild(key, size)(size);
            }
          }
        }

        return (x5large ??
            x4large ??
            x3large ??
            xxlarge ??
            xlarge ??
            large ??
            medium ??
            xmedium)!(size);
      },
    );
  }
}

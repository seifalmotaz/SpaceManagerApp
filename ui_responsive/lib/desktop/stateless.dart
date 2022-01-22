import 'package:flutter/material.dart';
import 'package:ui_responsive/constant.dart';

mixin DesktopMixin {
  Widget? x5large(BuildContext context, Size size) {}
  Widget? x4large(BuildContext context, Size size) {}
  Widget? x3large(BuildContext context, Size size) {}
  Widget? xxlarge(BuildContext context, Size size) {}
  Widget? xlarge(BuildContext context, Size size) {}
  Widget? large(BuildContext context, Size size) {}
  Widget? medium(BuildContext context, Size size) {}
  Widget? xmedium(BuildContext context, Size size) {}
}

class UIDesktopless extends StatelessWidget with DesktopMixin {
  const UIDesktopless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int buildScreens = 0;
    Widget? screen;
    Size size = MediaQuery.of(context).size;

    screen = x5large(context, size);
    if (screen != null) buildScreens++;

    screen = x4large(context, size);
    if (screen != null) buildScreens++;

    screen = x3large(context, size);
    if (screen != null) buildScreens++;

    screen = xxlarge(context, size);
    if (screen != null) buildScreens++;

    screen = xlarge(context, size);
    if (screen != null) buildScreens++;
    screen = large(context, size);
    if (screen != null) buildScreens++;

    screen = medium(context, size);
    if (screen != null) buildScreens++;

    screen = xmedium(context, size);
    if (screen != null) buildScreens++;

    if (buildScreens == 1 && screen != null) {
      return screen;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.of(context).size;
        Map screens = PlatformData.screens['desktop'];
        List screenKeys = screens.keys.toList();
        List screenValues = screens.values.toList();

        Widget child = (x5large(context, size) ??
            x4large(context, size) ??
            x3large(context, size) ??
            xxlarge(context, size) ??
            xlarge(context, size) ??
            large(context, size) ??
            medium(context, size) ??
            xmedium(context, size))!;

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

        return Container();
      },
    );
  }
}

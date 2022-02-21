part of widgets_group;

const int largeScreenSize = 1366;
const int customScreenSize = 1100;
const int mediumScreenSize = 768;
const int smallSceenSize = 360;

class UIResponsive extends StatelessWidget {
  const UIResponsive({
    Key? key,
    this.screen,
    this.largeDesktop,
    this.customDesktop,
    this.mediumDesktop,
    this.smallDesktop,
  }) : super(key: key);

  final Function(Size size)? screen;
  final Function(Size size)? largeDesktop;
  final Function(Size size)? customDesktop;
  final Function(Size size)? mediumDesktop;
  final Function(Size size)? smallDesktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.of(context).size;

        if (size.width >= largeScreenSize && largeDesktop != null) {
          return largeDesktop!(size);
        }
        if (size.width < largeScreenSize &&
            size.width >= customScreenSize &&
            customDesktop != null) {
          return customDesktop!(size);
        }

        if (size.width < customScreenSize &&
            size.width >= mediumScreenSize &&
            mediumDesktop != null) {
          return mediumDesktop!(size);
        }

        if (size.width < mediumScreenSize &&
            size.width >= smallSceenSize &&
            smallDesktop != null) {
          return smallDesktop!(size);
        }

        return screen!(size);
      },
    );
  }
}

abstract class UIResponsiveless extends StatelessWidget {
  const UIResponsiveless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int buildScreens = 0;
    Widget? screen;
    Size size = MediaQuery.of(context).size;

    screen = xBuild(context, size);
    if (screen != null) buildScreens++;

    screen = largeBuild(context, size);
    if (screen != null) buildScreens++;

    screen = customBuild(context, size);
    if (screen != null) buildScreens++;

    screen = mediumBuild(context, size);
    if (screen != null) buildScreens++;

    screen = smallBuild(context, size);
    if (screen != null) buildScreens++;

    if (buildScreens == 1 && screen != null) {
      return screen;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.of(context).size;

        Widget child = (xBuild(context, size) ??
            largeBuild(context, size) ??
            customBuild(context, size) ??
            mediumBuild(context, size) ??
            smallBuild(context, size))!;

        if (size.width >= largeScreenSize) {
          return largeBuild(context, size) ?? child;
        } else if (size.width < largeScreenSize &&
            size.width >= customScreenSize) {
          return customBuild(context, size) ?? child;
        } else if (size.width < largeScreenSize &&
            size.width >= mediumScreenSize) {
          return mediumBuild(context, size) ?? child;
        } else {
          return smallBuild(context, size) ?? child;
        }
      },
    );
  }

  Widget? xBuild(BuildContext context, Size size) {
    return null;
  }

  Widget? largeBuild(BuildContext context, Size size) {
    return null;
  }

  Widget? mediumBuild(BuildContext context, Size size) {
    return null;
  }

  Widget? smallBuild(BuildContext context, Size size) {
    return null;
  }

  Widget? customBuild(BuildContext context, Size size) {
    return null;
  }
}

abstract class UIResponsivefull extends StatefulWidget {
  const UIResponsivefull({Key? key}) : super(key: key);

  @override
  UIResponsiveState createState() => UIResponsiveState();
}

class UIResponsiveState<T extends UIResponsivefull>
    extends State<UIResponsivefull> {
  @override
  Widget build(BuildContext context) {
    int buildScreens = 0;
    Widget? screen;
    Size size = MediaQuery.of(context).size;

    screen = xBuild(context, size);
    if (screen != null) buildScreens++;

    screen = largeBuild(context, size);
    if (screen != null) buildScreens++;

    screen = customBuild(context, size);
    if (screen != null) buildScreens++;

    screen = mediumBuild(context, size);
    if (screen != null) buildScreens++;

    screen = smallBuild(context, size);
    if (screen != null) buildScreens++;

    if (buildScreens == 1 && screen != null) {
      return screen;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        size = MediaQuery.of(context).size;

        Widget child = (xBuild(context, size) ??
            largeBuild(context, size) ??
            customBuild(context, size) ??
            mediumBuild(context, size) ??
            smallBuild(context, size))!;

        if (size.width >= largeScreenSize) {
          return largeBuild(context, size) ?? child;
        } else if (size.width < largeScreenSize &&
            size.width >= customScreenSize) {
          return customBuild(context, size) ?? child;
        } else if (size.width < largeScreenSize &&
            size.width >= mediumScreenSize) {
          return mediumBuild(context, size) ?? child;
        } else {
          return smallBuild(context, size) ?? child;
        }
      },
    );
  }

  Widget? xBuild(BuildContext context, Size size) {
    return null;
  }

  Widget? largeBuild(BuildContext context, Size size) {
    return null;
  }

  Widget? mediumBuild(BuildContext context, Size size) {
    return null;
  }

  Widget? smallBuild(BuildContext context, Size size) {
    return null;
  }

  Widget? customBuild(BuildContext context, Size size) {
    return null;
  }
}

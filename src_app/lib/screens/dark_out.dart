import 'package:flutter/material.dart';

class DarkOutWithIgnoreWidget extends StatelessWidget {
  const DarkOutWithIgnoreWidget({
    Key? key,
    required this.widget,
    required this.isDarkOut,
    this.onTap,
  }) : super(key: key);

  final Widget widget;
  final bool isDarkOut;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: !isDarkOut
          ? widget
          : InkWell(
              onTap: onTap,
              highlightColor: null,
              focusColor: null,
              hoverColor: null,
              splashColor: null,
              overlayColor: null,
              child: IgnorePointer(
                ignoring: true,
                child: ColorFiltered(
                  child: widget,
                  colorFilter: ColorFilter.mode(
                    Colors.grey.shade600,
                    BlendMode.modulate,
                  ),
                ),
              ),
            ),
    );
  }
}

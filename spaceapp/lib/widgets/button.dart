import 'package:flutter/material.dart';
import 'package:spaceapp/constant/base_colors.dart';

class WButton extends StatelessWidget {
  const WButton({
    Key? key,
    required this.title,
    this.color,
    this.textColor,
    this.bottomMargin = false,
    this.border = true,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final bool bottomMargin;
  final Function() onTap;
  final Color? color;
  final Color? textColor;
  final bool border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(9),
        margin: bottomMargin ? null : const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: color ?? colorDarkLight,
          borderRadius: BorderRadius.circular(11),
          border: !border
              ? null
              : Border.all(color: colorWhiteBased.withOpacity(.61)),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: textColor ?? colorWhite,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

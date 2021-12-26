import 'package:flutter/material.dart';
import 'package:spacemanager/constants/base_colors.dart';

class SideButtonWidget extends StatelessWidget {
  const SideButtonWidget({
    Key? key,
    required this.icon,
    required this.onTap,
    this.margin = true,
  }) : super(key: key);

  final IconData icon;
  final Function()? onTap;
  final bool margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: margin ? 15 : 5),
      color: Colors.white,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        color: BaseColors.primary.withOpacity(.91),
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            icon,
            color: BaseColors.white,
            size: 37,
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:spacemanager/constants/base_colors.dart';

class SideButton extends StatelessWidget {
  const SideButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
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

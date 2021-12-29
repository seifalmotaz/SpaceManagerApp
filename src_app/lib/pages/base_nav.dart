import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/pages/side_button.dart';

class XButtonData {
  final dynamic Function()? ontap;
  final IconData iconData;
  XButtonData({required this.iconData, required this.ontap});
}

class BaseNav extends StatelessWidget {
  const BaseNav({
    Key? key,
    this.canBack = true,
    this.top = const [],
    this.bottom = const [],
  }) : super(key: key);

  final bool canBack;
  final List<XButtonData> top;
  final List<XButtonData> bottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kToolbarHeight,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 13),
      color: BaseColors.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              if (canBack)
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 7),
                  decoration: BoxDecoration(
                    color: BaseColors.white,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: BackButton(
                    color: BaseColors.primary,
                    onPressed: () => Get.back(),
                  ),
                ),
              for (XButtonData item in top)
                SideButtonWidget(
                  icon: item.iconData,
                  onTap: item.ontap,
                ),
            ],
          ),
          Column(
            children: [
              for (XButtonData item in bottom)
                SideButtonWidget(
                  icon: item.iconData,
                  onTap: item.ontap,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

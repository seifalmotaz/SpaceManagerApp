import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/widgets/resposive.dart';

class WIconButton {
  final String? title;
  final IconData icon;
  final Function() onTap;
  WIconButton({
    required this.icon,
    required this.onTap,
    this.title,
  });
}

class XTopBar extends UIResponsiveless {
  const XTopBar({
    Key? key,
    required this.title,
    this.leading,
    this.trailing,
  }) : super(key: key);

  final String title;
  final List<WIconButton>? leading;
  final List<WIconButton>? trailing;

  @override
  Widget xBuild(BuildContext context, Size size) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: kToolbarHeight,
        width: size.width * .97,
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 17),
        margin: const EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
          color: colorBittersweet,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                if (leading != null)
                  for (WIconButton item in leading!)
                    if (item.title == null)
                      IconButton(
                        onPressed: item.onTap,
                        icon: Icon(
                          item.icon,
                          color: colorWhite,
                        ),
                      )
                    else
                      TextButton.icon(
                        onPressed: item.onTap,
                        label: Text(
                          item.title!,
                          style: const TextStyle(
                            fontSize: 17,
                            color: colorWhite,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        icon: Icon(
                          item.icon,
                          color: colorWhite,
                          size: 23,
                        ),
                      )
                else if (Navigator.canPop(Get.context!))
                  BackButton(
                    color: colorWhite,
                    onPressed: () => Get.back(),
                  ),
                Text(
                  title,
                  style: const TextStyle(
                    color: colorWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                if (trailing != null)
                  for (WIconButton item in trailing!)
                    if (item.title == null)
                      IconButton(
                        onPressed: item.onTap,
                        icon: Icon(
                          item.icon,
                          color: colorWhite,
                        ),
                      )
                    else
                      TextButton.icon(
                        onPressed: item.onTap,
                        label: Text(
                          item.title!,
                          style: const TextStyle(
                            fontSize: 17,
                            color: colorWhite,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        icon: Icon(
                          item.icon,
                          color: colorWhite,
                          size: 23,
                        ),
                      )
              ],
            )
          ],
        ),
      ),
    );
  }
}

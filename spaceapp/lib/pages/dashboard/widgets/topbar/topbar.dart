import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/pages/dashboard/controllers/controller.dart';
import 'package:spaceapp/widgets/resposive.dart';

import 'main.dart';
import 'searching.dart';

class TopBarWidget extends UIResponsiveless {
  const TopBarWidget({Key? key}) : super(key: key);

  @override
  Widget xBuild(BuildContext context, Size size) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: kToolbarHeight,
        width: size.width * .91,
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 13),
        margin: const EdgeInsets.only(top: 27, bottom: 23),
        decoration: BoxDecoration(
          color: colorBittersweet,
          borderRadius: BorderRadius.circular(51),
        ),
        child: SizedBox.expand(
          child: Obx(
            () => AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: DashboardController.to.searching.value
                  ? const SearchingBar()
                  : const MainBar(),
            ),
          ),
        ),
      ),
    );
  }
}

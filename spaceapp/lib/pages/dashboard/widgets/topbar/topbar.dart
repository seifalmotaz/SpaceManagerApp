import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xwidgets/xwidgets.dart';
import 'package:spaceapp/pages/dashboard/controllers/searching.dart';

import 'main.dart';
import 'searching.dart';

const SliverToBoxAdapter paddingFromTopBar =
    SliverToBoxAdapter(child: SizedBox(height: kToolbarHeight * 1.61));

class TopBarWidget extends UIResponsiveless {
  const TopBarWidget({Key? key}) : super(key: key);

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
        child: SizedBox.expand(
          child: Obx(
            () => AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: SearchingController.to.searching.value
                  ? const SearchingBar()
                  : const MainBar(),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';
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
      child: SizedBox(
        width: size.width * .97,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: kToolbarHeight,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 17),
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
              ),
            ),
            const SizedBox(width: 7),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 37,
                height: kToolbarHeight * 1.27,
                decoration: BoxDecoration(
                  color: colorBittersweet.withOpacity(.81),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Material(
                  color: colorBittersweet.withOpacity(.81),
                  borderRadius: BorderRadius.circular(7),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(7),
                    child: const Center(
                      child: Icon(
                        Icons.minimize,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () => windowManager.minimize(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

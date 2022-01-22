import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/pages/dashboard/controllers/controller.dart';
import 'package:spaceapp/pages/dashboard/controllers/searching.dart';
import 'package:spaceapp/widgets/resposive.dart';

import 'shortcuts.dart';
import 'widgets/background.dart';
import 'widgets/rooms/item.dart';
import 'widgets/searching/guest_item.dart';
import 'widgets/topbar/topbar.dart';

class DashboardPage extends UIResponsiveless {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget largeBuild(BuildContext context, Size size) => _build(4);

  @override
  Widget customBuild(BuildContext context, Size size) => _build(3);

  @override
  Widget mediumBuild(BuildContext context, Size size) => _build(2);

  @override
  Widget smallBuild(BuildContext context, Size size) => _build(1);

  Widget _build(int crossAxisCount) {
    DashboardController controller = DashboardController.to;
    SearchingController searching = SearchingController.to;
    return DashboardShortcuts(
      child: Scaffold(
        key: controller.scaffold,
        backgroundColor: ColorPalette.white,
        body: DashboardBackground(
          Obx(
            () => CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: TopBarWidget()),
                if (searching.searching.value)
                  Obx(
                    () => SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 27),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (ctx, i) => GuestItem(searching.guests[i]),
                          childCount: searching.guests.value.length,
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 13,
                          mainAxisSpacing: 13,
                          mainAxisExtent: 285,
                        ),
                      ),
                    ),
                  ),
                if (!searching.searching.value)
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 27),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (ctx, i) => const RoomItem(),
                        childCount: 5,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        childAspectRatio: 1 / 1,
                        crossAxisSpacing: 13,
                        mainAxisSpacing: 13,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

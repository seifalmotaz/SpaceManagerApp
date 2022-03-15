import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/widgets/xwidgets.dart';
import 'package:spaceapp/pages/dashboard/controllers/controller.dart';

import 'item.dart';

List roomSessions() {
  DashboardController controller = DashboardController.to;
  return [
    Obx(
      () => controller.roomSessions.isEmpty
          ? const SliverToBoxAdapter()
          : const SliverPadding(
              padding: EdgeInsets.only(
                right: 27,
                left: 27,
                bottom: 11,
              ),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Room sessions: ',
                  style: TextStyle(
                    color: colorDarkLight,
                    fontSize: 27,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
    ),
    SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      sliver: Obx(
        () => SliverList(
          delegate: SliverChildBuilderDelegate(
            (ctx, i) => SessionItemWidget(
              controller.roomSessions[i],
              key: GlobalKey(),
            ),
            childCount: controller.roomSessions.length,
          ),
        ),
      ),
    )
  ];
}

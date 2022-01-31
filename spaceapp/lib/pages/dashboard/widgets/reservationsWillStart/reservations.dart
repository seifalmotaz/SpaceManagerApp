import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/pages/dashboard/controllers/controller.dart';

import 'item.dart';

List reservationsWillStart() {
  DashboardController controller = DashboardController.to;
  return [
    Obx(
      () => controller.reservations.isEmpty
          ? const SliverToBoxAdapter()
          : const SliverPadding(
              padding: EdgeInsets.only(
                right: 27,
                left: 27,
                bottom: 11,
              ),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Reservations: ',
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
            (ctx, i) => ReservationItemWidget(
              controller.reservations[i],
              key: GlobalKey(),
            ),
            childCount: controller.reservations.length,
          ),
        ),
      ),
    ),
  ];
}

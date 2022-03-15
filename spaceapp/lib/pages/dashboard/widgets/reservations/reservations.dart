import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/widgets/xwidgets.dart';
import 'package:spaceapp/pages/dashboard/controllers/controller.dart';

import 'course.dart';
import 'room.dart';

List roomReservations() {
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
                  'Reservations:',
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
            (ctx, i) => RoomReservationItemWidget(
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

List courseReservations() {
  DashboardController controller = DashboardController.to;
  return [
    Obx(
      () => controller.coursesReservations.isEmpty
          ? const SliverToBoxAdapter()
          : const SliverPadding(
              padding: EdgeInsets.only(
                right: 27,
                left: 27,
                bottom: 11,
              ),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Courses will start:',
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
            (ctx, i) => CourseReservationItemWidget(
              controller.coursesReservations[i],
              key: GlobalKey(),
            ),
            childCount: controller.coursesReservations.length,
          ),
        ),
      ),
    ),
  ];
}

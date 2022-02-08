import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/pages/course/read/controller.dart';
import 'package:spaceapp/pages/reservation/create/create.dart';
import 'package:spaceapp/widgets/resposive.dart';
import 'package:spaceapp/widgets/scaffold.dart';
import 'package:spaceapp/widgets/topbar.dart';

import 'widgets/data.dart';
import 'widgets/form.dart';
import 'widgets/groups.dart';
import 'widgets/tile.dart';

class ReedCoursePage extends UIResponsiveless {
  const ReedCoursePage(this.course, {Key? key}) : super(key: key);

  final Course course;

  @override
  Widget? xBuild(BuildContext context, Size size) =>
      _build(context, (size.width - 600));

  @override
  Widget? largeBuild(BuildContext context, Size size) =>
      _build(context, (size.width - 600));

  @override
  Widget customBuild(BuildContext context, Size size) =>
      _build(context, (size.width - 600));

  @override
  Widget? mediumBuild(BuildContext context, Size size) =>
      _build(context, size.width);

  @override
  Widget? smallBuild(BuildContext context, Size size) =>
      _build(context, size.width);

  Widget _build(BuildContext context, double sizeOfReservationsList) {
    ReadCourseController controller = Get.put(ReadCourseController(course));
    return WScaffold(
      title: 'Course: ${course.name}',
      trailing: [
        WIconButton(
          title: 'New reservations',
          icon: Icons.more_time_sharp,
          onTap: () => Get.to(() => CreateReservationPage(null, course)),
        ),
      ],
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: topbarPadding.height!,
          horizontal: 13,
        ),
        child: Wrap(
          spacing: 17,
          runSpacing: 17,
          children: [
            Column(
              children: [
                CourseDataWidget(course: course),
                const SizedBox(height: 13),
                CourseFormWidget(course: course),
              ],
            ),
            SizedBox(
              width: sizeOfReservationsList,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Reservation groups:',
                    style: TextStyle(
                      color: colorDarkLight,
                      fontSize: 27,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 7),
                  const GroupsListWidget(),
                  const SizedBox(height: 11),
                  Obx(() => ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.selectedReservations_.length,
                        itemBuilder: (cntx, i) {
                          return ReservationTileWidget(
                            controller.selectedReservations[i],
                            key: GlobalKey(),
                          );
                        },
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

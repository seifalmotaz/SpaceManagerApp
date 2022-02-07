import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/pages/course/read/controller.dart';
import 'package:spaceapp/pages/reservation/create/create.dart';
import 'package:spaceapp/widgets/scaffold.dart';
import 'package:spaceapp/widgets/topbar.dart';

import 'widgets/data.dart';
import 'widgets/form.dart';

class ReedCoursePage extends StatelessWidget {
  const ReedCoursePage(this.course, {Key? key}) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
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
          children: [
            Column(
              children: [
                CourseDataWidget(course: course),
                const SizedBox(height: 13),
                CourseFormWidget(course: course),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/pages/course/create/create.dart';
import 'package:spaceapp/pages/course/list/controller.dart';
import 'package:spaceapp/pages/dashboard/widgets/background.dart';
import 'package:spaceapp/widgets/topbar.dart';

import 'item.dart';

class CoursesListPage extends StatelessWidget {
  const CoursesListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CoursesListController controller = Get.put(CoursesListController());
    return Scaffold(
      body: DashboardBackground(
        Stack(
          children: [
            WTopBar(
              title: 'Courses',
              trailing: [
                WIconButton(
                  icon: Icons.add,
                  title: 'Add',
                  onTap: () => Get.dialog(const CreateCourseScreen()),
                ),
              ],
            ),
            Column(
              children: [
                topbarPadding,
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      itemCount: controller.courses.length,
                      padding: const EdgeInsets.all(11),
                      itemBuilder: (context, index) {
                        Course course = controller.courses[index];
                        return CourseItemWidget(course, key: GlobalKey());
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/pages/course/create/create.dart';
import 'package:spaceapp/pages/dashboard/widgets/background.dart';
import 'package:spaceapp/widgets/topbar.dart';

class CoursesListPage extends StatelessWidget {
  const CoursesListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashboardBackground(
        Stack(
          children: [
            XTopBar(
              title: 'Courses',
              trailing: [
                WIconButton(
                  icon: Icons.add,
                  title: 'Add',
                  onTap: () => Get.dialog(const CreateCourseScreen()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

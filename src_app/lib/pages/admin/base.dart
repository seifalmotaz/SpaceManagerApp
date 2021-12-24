import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/pages/admin/courses/courses.dart';
import 'package:spacemanager/pages/admin/prices/prices.dart';
import 'package:spacemanager/pages/admin/staff/staff.dart';

class AdminBaseLayout extends StatelessWidget {
  const AdminBaseLayout(this.body, {Key? key}) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BaseColors.primary,
        title: const Text('Space admin'),
        actions: [
          TextButton(
            onPressed: () => Get.off(() => const EditStaffPage()),
            child: const Text(
              'Staff',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () => Get.off(() => const EditPricesPage()),
            child: const Text(
              'Prices',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () => Get.off(() => const EditCoursesPage()),
            child: const Text(
              'Courses',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: body,
    );
  }
}

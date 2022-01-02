import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/pages/admin/courses/courses.dart';
import 'package:spacemanager/pages/admin/prices/prices.dart';
import 'package:spacemanager/pages/admin/rooms/rooms.dart';
import 'package:spacemanager/pages/admin/staff/staff.dart';
import 'package:spacemanager/pages/base_nav.dart';

class AdminBaseLayout extends StatelessWidget {
  const AdminBaseLayout(this.body, {Key? key}) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          BaseNav(
            top: [
              XButtonData(
                iconData: Icons.person_pin_rounded,
                ontap: () => Get.off(() => const EditStaffPage()),
              ),
              XButtonData(
                iconData: Icons.monetization_on_rounded,
                ontap: () => Get.off(() => const EditPricesPage()),
              ),
              XButtonData(
                iconData: Icons.school,
                ontap: () => Get.off(() => const EditCoursesPage()),
              ),
              XButtonData(
                iconData: Icons.room_preferences_outlined,
                ontap: () => Get.off(() => const EditRoomsPage()),
              ),
            ],
          ),
          Expanded(child: body),
        ],
      ),
    );
  }
}

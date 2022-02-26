import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceadmin/pages/prices/prices.dart';
import 'package:spaceadmin/pages/rooms/rooms.dart';
import 'package:spaceadmin/pages/staff/staff.dart';

import '../widgets/scaffold.dart';

class AdminPanel extends StatelessWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScaffold(
      title: 'Admin Panel',
      child: Container(),
      actions: [
        TextButton.icon(
          icon: const Icon(
            Icons.person,
            color: Colors.white,
          ),
          label: const Text(
            'Staff',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              // fontSize: 23,
            ),
          ),
          onPressed: () => Get.to(() => const StaffPage()),
        ),
        TextButton.icon(
          icon: const Icon(
            Icons.attach_money,
            color: Colors.white,
          ),
          label: const Text(
            'Prices',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              // fontSize: 23,
            ),
          ),
          onPressed: () => Get.to(() => const PricesManagementPage()),
        ),
        TextButton.icon(
          icon: const Icon(
            Icons.room_preferences_outlined,
            color: Colors.white,
          ),
          label: const Text(
            'Rooms',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              // fontSize: 23,
            ),
          ),
          onPressed: () => Get.to(() => const RoomsManagementPage()),
        ),
      ],
    );
  }
}

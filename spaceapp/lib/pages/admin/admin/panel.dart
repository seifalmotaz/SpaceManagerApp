import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/pages/admin/pages/prices/prices.dart';
import 'package:spaceapp/pages/admin/pages/rooms/rooms.dart';
import 'package:spaceapp/pages/admin/pages/staff/staff.dart';
import 'package:spaceapp/widgets/xwidgets.dart';

class AdminPanel extends StatelessWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScaffold(
      title: 'Admin Panel',
      child: Container(),
      trailing: [
        WIconButton(
          icon: Icons.person,
          title: 'Staff',
          onTap: () => Get.to(() => const StaffPage()),
        ),
        WIconButton(
          icon: Icons.attach_money,
          title: 'Prices',
          onTap: () => Get.to(() => const PricesManagementPage()),
        ),
        WIconButton(
          icon: Icons.room_preferences_outlined,
          title: 'Rooms',
          onTap: () => Get.to(() => const RoomsManagementPage()),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/pages/dashboard/controllers/controller.dart';

import 'widgets/background.dart';
import 'widgets/rooms.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashboardController controller = DashboardController.to;
    return Scaffold(
      key: controller.scaffold,
      backgroundColor: ColorPalette.white,
      appBar: AppBar(
        backgroundColor: ColorPalette.bittersweet,
        title: const Text(
          'DashRooms',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton.icon(
            icon: const Icon(Icons.admin_panel_settings),
            label: const Text(
              'Admin',
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: const [
          DashboardBackground(),
          RoomsWidget(),
        ],
      ),
    );
  }
}

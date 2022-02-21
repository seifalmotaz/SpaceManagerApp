import 'package:flutter/material.dart';
import 'package:xwidgets/xwidgets.dart';
import 'package:spaceapp/pages/dashboard/controllers/controller.dart';
import 'package:spaceapp/pages/dashboard/widgets/content.dart';

import 'shortcuts.dart';
import 'widgets/background.dart';
import 'widgets/topbar/topbar.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashboardController controller = DashboardController.to;
    return DashboardShortcuts(
      child: Scaffold(
        key: controller.scaffold,
        backgroundColor: ColorPalette.white,
        body: DashboardBackground(
          Stack(
            children: const [
              ContentWidget(),
              TopBarWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

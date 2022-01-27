import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:spaceapp/pages/dashboard/widgets/background.dart';
import 'package:spaceapp/pages/reservation/create/widgets/topbar.dart';

class CreateReservationPage extends StatelessWidget {
  const CreateReservationPage(this.guest, {Key? key}) : super(key: key);

  final Guest guest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashboardBackground(
        Stack(
          children: const [
            TopBarWidget(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/pages/course/read/controller.dart';
import 'package:spaceapp/pages/course/read/widgets/tile.dart';

class ReservationsListWidget extends StatelessWidget {
  const ReservationsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReadCourseController controller = Get.find<ReadCourseController>();
    return ListView.builder(
      itemCount: controller.selectedReservations_.length,
      itemBuilder: (cntx, i) {
        return ReservationTileWidget(controller.selectedReservations[i]);
      },
    );
  }
}

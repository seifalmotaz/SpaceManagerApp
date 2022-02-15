import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/pages/guest/read/controller.dart';

import 'tile.dart';

class ReservationsListWidget extends StatelessWidget {
  const ReservationsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReadGuestController controller = Get.find<ReadGuestController>();
    return Obx(() {
      if (controller.selectedReservations_.isNotEmpty) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: controller.selectedReservations_.length,
          itemBuilder: (cntx, i) {
            return ReservationTileWidget(controller.selectedReservations[i]);
          },
        );
      }
      return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.reservations_.length,
        itemBuilder: (cntx, i) {
          return ReservationTileWidget(controller.reservations_[i]);
        },
      );
    });
  }
}

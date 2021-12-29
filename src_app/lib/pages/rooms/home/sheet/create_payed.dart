import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/constants/error_snack.dart';
import 'package:spacemanager/models/reservations/src.dart';
import 'package:spacemanager/pages/rooms/home/controller.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CreateReservationPayedIntent extends Intent {}

class CreateReservationPayedAction
    extends Action<CreateReservationPayedIntent> {
  @override
  Future<Object?> invoke(covariant CreateReservationPayedIntent intent) async {
    RoomsController controller = Get.find<RoomsController>();
    List list = [];
    for (List item in controller.appointmentsList.values) {
      list.addAll(item);
    }
    for (Appointment item in list) {
      Reservation res = Reservation(
        startTime: item.startTime,
        endTime: item.endTime,
        guestId: controller.guest.value!.guest.id!,
        isPrePaid: true,
        roomId: controller.room.value!.id!,
      );
      try {
        await res.create();
      } catch (e) {
        errorSnack('Code error', e.toString());
        return Object();
      }
    }
    Get.back(closeOverlays: true);
  }
}

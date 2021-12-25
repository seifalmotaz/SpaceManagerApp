import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/models/reservations/src.dart';
import 'package:spacemanager/models/rooms/src.dart';
import 'package:spacemanager/models/sessions/src.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class RoomsController extends GetxController {
  RoomsController([GuestWithSession? u]) {
    guest.value = u;
  }

  RxList<RoomWithReservations> rooms = <RoomWithReservations>[].obs;
  ScrollController conentScrollController = ScrollController();

  Rx<Room?> room = Rx<Room?>(null);
  Rx<GuestWithSession?> guest = Rx<GuestWithSession?>(null);

  RxList<Appointment> appointments = RxList<Appointment>();

  Future getRoomsReservations() async {
    List<Room> _rooms = await RoomCRUDQuery.list();
    List<RoomWithReservations> roomsReservations = [];
    for (Room r in _rooms) {
      List<Reservation> res =
          await ReservationJoinsQuery.getByDateAndRoom(r.id!);
      ReservationWithSessionWithGuest? runningSession =
          await SessionFindQuery.findNotEndedWithRoom(r.id!);
      roomsReservations.add(RoomWithReservations(
        room: r,
        running: runningSession,
        reservations: res,
      ));
    }
    rooms.value = roomsReservations;
  }

  @override
  void onInit() {
    getRoomsReservations();
    super.onInit();
  }
}

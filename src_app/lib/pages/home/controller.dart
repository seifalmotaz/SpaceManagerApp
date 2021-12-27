import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/models/reservations/src.dart';
import 'package:spacemanager/models/rooms/src.dart';
import 'package:spacemanager/models/sessions/src.dart';
import 'package:spacemanager/services/storage.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  RxInt spaceCurrentCapacity = 0.obs;
  RxInt spaceCapacity = 0.obs;

  RxBool guestsSearching = false.obs;
  FocusNode shortcutChildFocus = FocusNode();

  RxList<RoomWithReservations> rooms = <RoomWithReservations>[].obs;

  Future getRoomsReservations() async {
    List<Room> _rooms = await RoomCRUDQuery.list();
    List<RoomWithReservations> roomsReservations = [];
    for (Room r in _rooms) {
      List<ReservationWithGuest> res =
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

  streamRooms() {
    Timer.periodic(const Duration(minutes: 5), (timer) {
      getRoomsReservations();
    });
  }

  restart() {
    guestsSearching.value = false;
    getRoomsReservations();
    getHowManyInSpace();
  }

  @override
  void onInit() {
    getRoomsReservations();
    getHowManyInSpace();
    streamRooms();
    super.onInit();
  }

  getHowManyInSpace() async {
    int _data = await SessionFindQuery.findAllNotEndedWithGuestNum();
    spaceCapacity.value = await StorageService.to.capacity;
    spaceCurrentCapacity.value = _data;
  }
}

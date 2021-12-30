import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/models/reservations/src.dart';
import 'package:spacemanager/models/rooms/src.dart';
import 'package:spacemanager/models/sessions/src.dart';
import 'package:spacemanager/services/storage/storage.dart';

import 'package:spacemanager/pages/home/controllers/rooms.dart';
import 'package:spacemanager/pages/home/controllers/courses.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  //
  RxInt spaceCurrentCapacity = 0.obs;
  RxInt spaceCapacity = 0.obs;

  //
  RxBool guestsSearching = false.obs;
  FocusNode shortcutChildFocus = FocusNode();
  FocusNode searchingFocus = FocusNode();

  //
  RxList<RoomWithReservations> rooms = <RoomWithReservations>[].obs;
  RxList<ReservationWithCourse> courses = <ReservationWithCourse>[].obs;
  RxList<SessionWithCourse> coursesPricing = <SessionWithCourse>[].obs;

  //
  Rx<Guest?> courseGuest = Rx<Guest?>(null);
  bool get isCourseGuest => courseGuest.value != null;

  streamRooms() {
    Timer.periodic(const Duration(minutes: 5), (timer) {
      getRoomsReservations();
      getCoursesReservations();
    });
  }

  getCoursesPricing() async {
    List<SessionWithCourse> list =
        await SessionFindQuery.findCoursesThatJustEnded();
    coursesPricing.value = list;
  }

  getHowManyInSpace() async {
    int _data = await SessionFindQuery.findAllNotEndedWithGuestNum();
    spaceCapacity.value = await StorageService.to.capacity;
    spaceCurrentCapacity.value = _data;
  }

  restart() {
    guestsSearching.value = false;
    getRoomsReservations();
    getHowManyInSpace();
    getCoursesReservations();
    getCoursesPricing();
  }

  @override
  void onReady() {
    super.onReady();
    getRoomsReservations();
    getHowManyInSpace();
    getCoursesReservations();
    getCoursesPricing();
    streamRooms();
  }
}

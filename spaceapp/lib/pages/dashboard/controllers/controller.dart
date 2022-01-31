import 'dart:async';

import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/pages/dashboard/controllers/searching.dart';

class DashboardController extends GetxController {
  // calling func
  static DashboardController get to => Get.find();

  // global vars
  PageController pageController = PageController();
  GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();
  FocusNode shortcutChildFocus = FocusNode();

  // rooms data
  RxList<Room> rooms = RxList<Room>([]);

  // reservations going to start
  RxList<GuestReservation$Room$Guest> reservations =
      RxList<GuestReservation$Room$Guest>([]);

  // current room sesstions
  RxList<RoomSession> roomSessions = RxList<RoomSession>([]);
  // current courses
  RxList<CourseSession> currentCourses = RxList<CourseSession>([]);

  @override
  void onReady() {
    super.onReady();
    resetData();
    Timer.periodic(const Duration(minutes: 5), (timer) => resetData());
  }

  resetData() async {
    reservations.value = await guestReservationQuery.findWillStart$Room$Guest();
    rooms.value = await roomQuery.find(isDeleted: false);
    roomSessions.value = await roomSessionQuery.getCurrent();
    currentCourses.value = await courseSessionQuery.getCurrent();
  }

  toMainPage() {
    resetData();
    SearchingController.to.searchingController.text = '';
    SearchingController.to.guests.value = [];
    SearchingController.to.searching.value = false;
    shortcutChildFocus.requestFocus();
  }
}

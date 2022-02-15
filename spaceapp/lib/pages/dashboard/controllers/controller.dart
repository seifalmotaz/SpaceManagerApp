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
  RxList<GuestReservation> reservations = RxList<GuestReservation>([]);
  RxList<CourseReservation> coursesReservations = RxList<CourseReservation>([]);

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
    // rooms data
    rooms.value = await roomQuery.find(isDeleted: false);
    roomSessions.value = await roomSessionQuery.getCurrent();
    reservations.value = await guestReservationQuery.findWillStart();
    // courses data
    currentCourses.value = await courseSessionQuery.getCurrent();
    coursesReservations.value = await courseReservationQuery.findWillStart();
  }

  toMainPageUpdate() {
    resetData();
    toMainPage();
  }

  toMainPage() {
    SearchingController.to.searchingController.text = '';
    SearchingController.to.guests.value = [];
    SearchingController.to.searching.value = false;
    shortcutChildFocus.requestFocus();
  }
}

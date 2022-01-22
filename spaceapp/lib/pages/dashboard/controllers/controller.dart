import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  // calling func
  static DashboardController get to => Get.find();

  // searching vars
  RxBool searching = false.obs;
  TextEditingController searchingController = TextEditingController();
  FocusNode searchingFocus = FocusNode();
  // global vars
  PageController pageController = PageController();
  GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();
  FocusNode shortcutChildFocus = FocusNode();

  // rooms data
  RxList<Room> rooms = RxList<Room>([]);
}

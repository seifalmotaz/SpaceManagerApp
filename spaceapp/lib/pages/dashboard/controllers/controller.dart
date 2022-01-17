import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.find();

  RxInt segmantController = 0.obs;
  PageController pageController = PageController();
  GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();
}

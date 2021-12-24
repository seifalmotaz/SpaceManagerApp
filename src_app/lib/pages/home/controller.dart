import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  RxBool guestsSearching = false.obs;
  FocusNode shortcutChildFocus = FocusNode();

  restart() {
    guestsSearching.value = false;
  }
}

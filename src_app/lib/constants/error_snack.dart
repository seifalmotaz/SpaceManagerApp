import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/constants/base_colors.dart';

errorSnack(t, m, [Duration? sec]) {
  return Get.snackbar(
    t,
    m,
    isDismissible: false,
    colorText: Colors.white,
    maxWidth: Get.width * .3,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: BaseColors.primary,
    duration: sec,
    margin: const EdgeInsets.symmetric(vertical: 51),
  );
}

successSnack(t, m) {
  return Get.snackbar(
    t,
    m,
    isDismissible: false,
    colorText: Colors.black,
    maxWidth: Get.width * .3,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.greenAccent,
    margin: const EdgeInsets.symmetric(vertical: 51),
  );
}

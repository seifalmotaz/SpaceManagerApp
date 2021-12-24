import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/constants/base_colors.dart';

errorSnack(t, m) {
  return Get.snackbar(
    t,
    m,
    isDismissible: false,
    colorText: Colors.white,
    maxWidth: Get.width * .3,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: BaseColors.primary,
    margin: const EdgeInsets.symmetric(vertical: 51),
  );
}

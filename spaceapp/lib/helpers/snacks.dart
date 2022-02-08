import 'package:flutter/material.dart';
import 'package:get/get.dart';

codeError(m, [Duration? sec]) {
  return Get.snackbar(
    'Code Error',
    m,
    isDismissible: true,
    colorText: Colors.white,
    maxWidth: Get.width * .3,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    duration: sec ?? const Duration(minutes: 1),
    margin: const EdgeInsets.symmetric(vertical: 51),
  );
}

errorSnack(t, m, [Duration? sec]) {
  return Get.snackbar(
    t,
    m,
    isDismissible: true,
    colorText: Colors.white,
    maxWidth: 500,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    duration: sec,
    margin: const EdgeInsets.symmetric(vertical: 51),
  );
}

successSnack(t, m) {
  return Get.snackbar(
    t,
    m,
    isDismissible: true,
    colorText: Colors.black,
    maxWidth: 500,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.greenAccent,
    duration: const Duration(seconds: 3),
    margin: const EdgeInsets.symmetric(vertical: 51),
  );
}

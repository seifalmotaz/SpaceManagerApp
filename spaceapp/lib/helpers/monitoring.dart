import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MonitoringApp {
  static sendError(exception, StackTrace stackTrace) {
    // await Sentry.captureException(
    //   exception,
    //   stackTrace: stackTrace,
    // );
  }

  static error(exception, StackTrace stackTrace, [dynamic hint]) {
    // await Sentry.captureException(
    //   exception,
    //   stackTrace: stackTrace,
    //   hint: hint,
    // );

    String err = '';
    if (exception.toString().length > 250) {
      err = exception.toString().substring(0, 250);
    } else {
      err = exception.toString();
    }

    Get.snackbar(
      'Error tracker',
      err,
      isDismissible: true,
      colorText: Colors.white,
      maxWidth: Get.width * .3,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 10),
      margin: const EdgeInsets.symmetric(vertical: 51),
    );
  }

  static Future errorTrack(Function() func) async {
    try {
      await func();
    } catch (exception, stackTrace) {
      error(exception, stackTrace);
    }
  }
}

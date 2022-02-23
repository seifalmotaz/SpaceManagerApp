library autoupdater;

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:window_manager/window_manager.dart';

part 'download.dart';
part 'constants.dart';
part 'updates_checker.dart';

Future<void> autoUpdater() async {
  AppVersion appVersion = await getAppVersion();
  if (appVersion.isUpdated) return;

  Get.snackbar(
    'New update',
    'there is new update for the app, please update it as quickly as possible. Tap to update.',
    maxWidth: 500,
    padding: const EdgeInsets.all(13),
    backgroundColor: Colors.white,
    colorText: Colors.grey.shade800,
    duration: const Duration(seconds: 120),
    snackPosition: SnackPosition.BOTTOM,
    borderRadius: 0,
  );
}

Future<void> updateIt() async {
  AppVersion appVersion = await getAppVersion();
  String source = await downloadExe(appVersion.exeUrl);
  Process.run(source, []);
  windowManager.setAlwaysOnTop(true);
  await Future.delayed(const Duration(seconds: 15));
  exit(0);
}

Future<void> downgradeIt() async {
  AppVersion appVersion = await getAppVersion();
  String source = await downloadExe(appVersion.downgradeUrl);
  Process.run(source, []);
  windowManager.setAlwaysOnTop(true);
  await Future.delayed(const Duration(seconds: 15));
  exit(0);
}

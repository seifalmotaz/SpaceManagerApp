import 'package:database_system/database_system.dart';

import 'package:spaceapp/pages/dashboard/controllers/binding.dart';
import 'package:spaceapp/pages/dashboard/dashboard.dart';
import 'package:spaceapp/pages/guest/login.dart';
import 'package:spaceapp/services/auth.dart';
import 'package:spaceapp/services/guests.dart';
import 'package:spaceapp/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:spaceapp/widgets/xwidgets.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  start() async {
    // connect storage
    StorageService storage =
        await Get.putAsync<StorageService>(() async => StorageService());
    bool wait = await storage.connect();
    if (!wait) return;

    await Future.delayed(const Duration(seconds: 1));

    await Get.putAsync<MemoryGuestsService>(() async => MemoryGuestsService());

    // connect db
    DBService db = await Get.putAsync<DBService>(() async => DBService());
    try {
      await db.connect();
    } catch (e, s) {
      MonitoringApp.error(e, s);
      return;
    }

    // create auth service
    await Get.putAsync<AuthService>(() async => AuthService());
    await Future.delayed(const Duration(seconds: 2));

    StaffSession? session = await staffSessionQuery.lastLogin();
    if (session != null) {
      AuthService.to.guestData.value = session.guest;
      AuthService.to.sessionData.value = session;
      Get.offAll(
        () => const DashboardPage(),
        binding: DashboardBinding(),
      );
      return;
    }

    Get.offAll(() => const LoginPage());
    return;
  }

  @override
  void initState() {
    super.initState();
    start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgrounds/wrapper.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: const Center(
          child: SpinKitFadingCircle(
            color: Colors.white,
            size: 101,
          ),
        ),
      ),
    );
  }
}

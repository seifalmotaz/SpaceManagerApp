import 'package:database_system/database_system.dart';
import 'package:spaceadmin/helpers/snacks.dart';
import 'package:spaceadmin/pages/login.dart';
import 'package:spaceadmin/services/auth.dart';
import 'package:spaceadmin/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

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
    await storage.connect();

    await Future.delayed(const Duration(seconds: 1));

    // connect db
    DBService db = await Get.putAsync<DBService>(() async => DBService());
    try {
      await db.connect();
    } catch (e) {
      errorSnack('Code error', e.toString(), const Duration(minutes: 5));
      return;
    }

    // create auth service
    await Get.putAsync<AuthService>(() async => AuthService());

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

import 'package:flutter/material.dart';
import 'package:spaceapp/pages/wrapper.dart';
import 'package:get/get.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:window_manager/window_manager.dart';
import 'package:spaceapp/widgets/xwidgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();

  await windowManager.ensureInitialized();
  windowManager.waitUntilReadyToShow().then((_) async {
    // await windowManager.setAsFrameless();
    // await windowManager.maximize();
    windowManager.show();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Space management',
      home: const Wrapper(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: colorBittersweet,
          primary: colorBittersweet,
          secondary: const Color(0xFF57c8d3),
        ),
      ),
    );
  }
}

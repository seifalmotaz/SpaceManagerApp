import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/pages/wrapper.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // add window manager.
  await windowManager.ensureInitialized();
  windowManager.waitUntilReadyToShow().then((_) async {
    // Set to frameless window
    await windowManager.setFullScreen(true);
    await windowManager.setTitle('Space Manager');
    windowManager.show();
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Space Manager',
      debugShowCheckedModeBanner: false,
      home: WrapperPage(),
    );
  }
}

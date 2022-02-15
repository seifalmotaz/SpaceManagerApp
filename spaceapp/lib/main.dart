import 'package:flutter/material.dart';
import 'package:spaceapp/pages/wrapper.dart';
import 'package:get/get.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();
  await windowManager.ensureInitialized();

  windowManager.waitUntilReadyToShow().then((_) async {
    // await windowManager.setAsFrameless();
    // await windowManager.maximize();
    windowManager.show();
  });

  // await SentryFlutter.init(
  //   (options) {
  //     options.tracesSampleRate = 1.0;
  //     options.dsn =
  //         'https://270e51a5dfac40799b6e269b05dbcb87@o1126736.ingest.sentry.io/6168003';
  //
  //   },
  //   appRunner: () => runApp(const MyApp()),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Space management',
      home: Wrapper(),
      themeMode: ThemeMode.dark,
    );
  }
}

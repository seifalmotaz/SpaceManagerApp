// import 'dart:io';

// import 'package:crypt/crypt.dart';
// import 'package:path/path.dart' as p;
// import 'package:drift/drift.dart' as drift;
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:spacemanager/pages/home/home.dart';
// import 'package:spacemanager/pages/login/login.dart';
// import 'package:spacemanager/services/auth.dart';
// import 'package:spacemanager/services/database.dart';
// import 'package:spacemanager/services/storage.dart';

// class WrapperPage extends StatefulWidget {
//   const WrapperPage({Key? key}) : super(key: key);

//   @override
//   State<WrapperPage> createState() => _WrapperPageState();
// }

// class _WrapperPageState extends State<WrapperPage> {
//   start() async {
//     // connect storage
//     StorageService storage =
//         await Get.putAsync<StorageService>(() async => StorageService());
//     await storage.connect();
//     await Future.delayed(const Duration(milliseconds: 300));

//     // create db if first time open the app
//     bool isFirstRun = await storage.isFirstRun;
//     if (isFirstRun) {
//       final dbFolder = await getApplicationDocumentsDirectory();
//       final file = File(p.join(dbFolder.path, 'SpaceData', 'database.sqlite'));
//       if (await file.exists()) {
//         await file.delete();
//       }
//     }

//     // connect db
//     DBService dbService =
//         await Get.putAsync<DBService>(() async => DBService());
//     await Future.delayed(const Duration(milliseconds: 300));

//     if (isFirstRun) {
//       await dbService.db.insertGuest(GuestsCompanion.insert(
//         phone: '101SpaceAdmin',
//         isAdmin: const drift.Value<bool>(true),
//         isStaff: const drift.Value<bool>(true),
//         career: const drift.Value<String>('ADMIN'),
//         password:
//             drift.Value<String?>(Crypt.sha256('101SpaceAdmin').toString()),
//       ));
//       await storage.setFirstRun(false);
//     }

//     // create auth service
//     await Get.putAsync<AuthService>(() async => AuthService());
//     await Future.delayed(const Duration(seconds: 3));

//     Session? session = await dbService.db.getLastStaffSession();
//     if (session != null) {
//       AuthService.to.isAuthenticated.value = true;
//       AuthService.to.guestData.value =
//           await dbService.db.getGuest(session.guestId);
//       AuthService.to.sessionData.value = session;
//       Get.offUntil(
//         GetPageRoute(
//           page: () => const HomePage(),
//         ),
//         (route) => false,
//       );
//     }

//     Get.offUntil(
//       GetPageRoute(
//         page: () => const LogInPage(),
//       ),
//       (route) => false,
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     start();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/backgrounds/WrapperBG.jpg'),
//             fit: BoxFit.fill,
//           ),
//         ),
//         child: const Center(
//           child: SpinKitSpinningLines(
//             color: Colors.white,
//             size: 101,
//             lineWidth: 4,
//           ),
//         ),
//       ),
//     );
//   }
// }

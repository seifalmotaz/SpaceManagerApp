import 'dart:io';

import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:autoupdater/autoupdater.dart';
import 'package:csv/csv.dart';
import 'package:database_system/database_system.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:spaceadmin/admin/panel.dart';
import 'package:xwidgets/xwidgets.dart';

import 'package:spaceapp/pages/guest/edit_guest.dart';
import 'package:spaceapp/pages/guest/login.dart';
import 'package:spaceapp/services/auth.dart';

import 'converting.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  String get sessionTime {
    DateTime start = AuthService.to.session!.timeIn;
    DateTime end = DateTime.now();
    DateTimeRange range = DateTimeRange(start: start, end: end);
    String hours = range.duration.inHours.toString();
    String minutes = (range.duration.inMinutes % 60).toString();
    return '${hours}H : ${minutes}M';
  }

  containerButton(
    String title, {
    bool last = false,
    required Function() onTap,
    Color? color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(9),
        margin: last ? null : const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: color ?? colorWhite,
          borderRadius: BorderRadius.circular(11),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: colorWhite,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                '@' + AuthService.to.guest!.toString(),
                style: const TextStyle(
                  fontSize: 23,
                  color: colorWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              sessionTime,
              style: const TextStyle(
                fontSize: 21,
                color: colorWhite,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 11),
        const Text(
          'Data extraction:',
          style: TextStyle(
            color: colorWhiteBased,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: containerButton(
                'Guests to CSV',
                color: colorDarkLightest.withOpacity(.81),
                onTap: () async {
                  List<Guest> guests = await guestQuery.find();
                  List<Map<String, dynamic>> _guests = [
                    for (Guest g in guests) g.toJson()
                  ];
                  List<List<dynamic>> csvList =
                      ConvertingCSV.toCSVList(_guests);
                  String csv = const ListToCsvConverter().convert(csvList);
                  String? result = await FilePicker.platform.getDirectoryPath();
                  if (result != null) {
                    var file = File(result + '/guests.csv').openWrite();
                    file.write(csv);
                    file.close();
                  }
                },
              ),
            ),
            const SizedBox(width: 9),
            // Flexible(
            //   child: containerButton(
            //     'Sessions to CSV',
            //     color: colorDarkLightest.withOpacity(.81),
            //     onTap: () {},
            //   ),
            // ),
          ],
        ),
        const SizedBox(height: 9),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Flexible(
        //       child: containerButton(
        //         'Rooms to CSV',
        //         color: colorDarkLightest.withOpacity(.81),
        //         onTap: () {},
        //       ),
        //     ),
        //     const SizedBox(width: 9),
        //     Flexible(
        //       child: containerButton(
        //         'Reservations to CSV',
        //         color: colorDarkLightest.withOpacity(.81),
        //         onTap: () {},
        //       ),
        //     ),
        //   ],
        // ),
        const SizedBox(height: 11),
        const Text(
          'Staff options:',
          style: TextStyle(
            color: colorWhiteBased,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: containerButton(
                'Edit profile',
                color: Colors.blue,
                onTap: () => Get.dialog(
                  EditGuestScreen(
                    guest: AuthService.to.guest!,
                    onSave: (guest) {
                      AuthService.to.guestData.value = guest;
                      Get.back();
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(width: 9),
            Flexible(
              child: containerButton(
                'Logout',
                color: colorDarkLightest.withOpacity(.81),
                onTap: () async => MonitoringApp.errorTrack(() async {
                  await staffSessionQuery.update(
                    id: AuthService.to.guest!.id,
                    timeOut: DateTime.now(),
                  );
                  AuthService.to.guestData.value = null;
                  AuthService.to.sessionData.value = null;
                  Get.offAll(() => const LoginPage());
                }),
              ),
            ),
          ],
        ),
        const SizedBox(height: 13),
        Row(
          children: [
            Flexible(
              flex: 2,
              child: containerButton(
                'Close app',
                color: colorBittersweet,
                onTap: () async => MonitoringApp.errorTrack(() async {
                  await staffSessionQuery.update(
                    id: AuthService.to.guest!.id,
                    timeOut: DateTime.now(),
                  );
                  await DBService.to.db.close();
                  await Get.deleteAll();
                  exit(0);
                }),
              ),
            ),
            if (AuthService.to.guest!.isAdmin) const SizedBox(width: 9),
            if (AuthService.to.guest!.isAdmin)
              Flexible(
                child: containerButton(
                  'Admin panel',
                  color: colorDarkLightest,
                  onTap: () => Get.to(() => const AdminPanel()),
                ),
              ),
          ],
        ),
        const SizedBox(height: 7),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ArgonButton(
              height: 40,
              width: 200,
              borderRadius: 17,
              color: colorDarkLightest.withOpacity(.81),
              loader: Container(
                padding: const EdgeInsets.all(10),
                child: const SpinKitRotatingCircle(
                  color: Colors.white,
                ),
              ),
              onTap: (start, stop, state) async {
                start();
                await downgradeIt();
                stop();
              },
              child: const Text(
                'Downgrade app',
                style: TextStyle(
                  color: colorWhite,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 7),
            ArgonButton(
              height: 40,
              width: 200,
              borderRadius: 17,
              color: colorDarkLightest.withOpacity(.81),
              loader: Container(
                padding: const EdgeInsets.all(10),
                child: const SpinKitRotatingCircle(
                  color: Colors.white,
                ),
              ),
              onTap: (start, stop, state) async {
                start();
                await updateIt();
                stop();
              },
              child: const Text(
                'Upgrade app',
                style: TextStyle(
                  color: colorWhite,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

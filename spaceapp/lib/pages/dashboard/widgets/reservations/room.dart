import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/helpers/monitoring.dart';
import 'package:spaceapp/pages/dashboard/controllers/controller.dart';
import 'package:spaceapp/pages/dashboard/screens/widgets/widgets.dart';
import 'package:spaceapp/widgets/dialog.dart';

class RoomReservationItemWidget extends StatelessWidget {
  const RoomReservationItemWidget(this.reservation, {Key? key})
      : super(key: key);

  final GuestReservation reservation;

  start() => Get.dialog(WDialog(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Start the reservation:',
                  style: TextStyle(
                    color: colorWhite,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  Jiffy(DateTime.now()).jm,
                  style: const TextStyle(
                    fontSize: 21,
                    color: colorWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 13),
            dataLabel(
              i: 1,
              title: 'Guest',
              trailing: (reservation.guest!.name ??
                  reservation.guest!.phone ??
                  reservation.guest!.email)!,
            ),
            dataLabel(
              i: 2,
              title: 'Room',
              trailing: reservation.room!.name,
            ),
            dataLabel(
              i: 3,
              title: 'From: ' + Jiffy(reservation.timeIn).jm,
              trailing: 'To: ' + Jiffy(reservation.timeOut).jm,
            ),
            const SizedBox(height: 17),
            Center(
              child: ArgonButton(
                height: 35,
                width: 300,
                borderRadius: 13,
                child: const Text(
                  'Start',
                  style: TextStyle(
                    color: colorWhite,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                loader: Container(
                  padding: const EdgeInsets.all(10),
                  child: const SpinKitRotatingCircle(
                    color: Colors.white,
                  ),
                ),
                onTap: (startLoading, stopLoading, btnState) async {
                  startLoading();
                  await MonitoringApp.errorTrack(() async {
                    await roomSessionQuery.create(
                      roomId: reservation.room!.id,
                      guestId: reservation.guest!.id,
                      reservationId: reservation.id,
                    );
                  });
                  stopLoading();
                  Get.back();
                  DashboardController.to.toMainPage();
                },
              ),
            ),
          ],
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 13),
      decoration: const BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.all(Radius.circular(17)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Reservation by:',
                style: TextStyle(color: colorSemiText),
              ),
              Text(
                (reservation.guest!.name ??
                    reservation.guest!.phone ??
                    reservation.guest!.email)!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorText,
                  fontSize: 27,
                ),
              ),
            ],
          ),
          Column(
            children: [
              TextButton(
                onPressed: start,
                child: const Text(
                  'Start',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: colorText,
                    fontSize: 16,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Cancell',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: colorText,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'From: ',
                    style: TextStyle(color: colorSemiText),
                  ),
                  Text(
                    Jiffy(reservation.timeIn).jm,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: colorText,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'To: ',
                    style: TextStyle(color: colorSemiText),
                  ),
                  Text(
                    Jiffy(reservation.timeOut).jm,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: colorText,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Room: ',
                    style: TextStyle(color: colorSemiText),
                  ),
                  Text(
                    reservation.room!.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: colorText,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Name: ',
                    style: TextStyle(color: colorSemiText),
                  ),
                  Text(
                    reservation.primaryName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: colorText,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

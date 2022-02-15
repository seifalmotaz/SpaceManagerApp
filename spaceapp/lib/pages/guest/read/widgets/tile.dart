import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/helpers/snacks.dart';

class ReservationTileWidget extends StatefulWidget {
  const ReservationTileWidget(this.reservation, {Key? key}) : super(key: key);

  final Reservation reservation;

  @override
  State<ReservationTileWidget> createState() => _ReservationTileWidgetState();
}

class _ReservationTileWidgetState extends State<ReservationTileWidget> {
  late Reservation reservation;
  late Jiffy jiffyStart;
  late Jiffy jiffyEnd;
  bool passed = false;
  bool cancelled = false;

  @override
  void initState() {
    reservation = widget.reservation;
    jiffyStart = Jiffy(reservation.timeIn);
    jiffyEnd = Jiffy(reservation.timeOut);
    super.initState();
    if (!reservation.timeIn.isAfter(DateTime.now())) {
      setState(() {
        passed = true;
      });
    }
    setState(() {
      cancelled = reservation.isCancelled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      padding: const EdgeInsets.all(13),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: passed
            ? BaseColors.primary
            : cancelled
                ? BaseColors.lightPrimary
                : Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'From:  ',
                style: TextStyle(
                  color: passed ? Colors.white70 : Colors.grey,
                ),
              ),
              Text(
                jiffyStart.MMMEd + ', ' + jiffyStart.jm,
                style: TextStyle(
                  color: passed ? Colors.white : Colors.blueGrey.shade800,
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'To:  ',
                style: TextStyle(
                  color: passed ? Colors.white70 : Colors.grey,
                ),
              ),
              Text(
                jiffyEnd.jm,
                style: TextStyle(
                  color: passed ? Colors.white : Colors.blueGrey.shade800,
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          if (cancelled && !passed)
            TextButton(
              child: Text(
                'Continue',
                style: TextStyle(
                  color: passed ? Colors.white70 : Colors.grey,
                ),
              ),
              onPressed: () {
                Get.snackbar(
                  'Are you sure',
                  'This reservation will be continue. Tap to confirm',
                  isDismissible: false,
                  colorText: Colors.white,
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: BaseColors.primary,
                  margin: const EdgeInsets.symmetric(vertical: 51),
                  onTap: (snack) async {
                    try {
                      await guestReservationQuery.update(
                        id: reservation.id,
                        isCancelled: false,
                      );
                      setState(() => cancelled = false);
                      Get.back();
                      successSnack(
                        'The reservation continued',
                        'The reservation continued without problems.',
                      );
                    } catch (e) {
                      errorSnack('Code error', e.toString());
                    }
                  },
                );
              },
            ),
          if (!cancelled && !passed)
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: passed ? Colors.white70 : Colors.grey,
                ),
              ),
              onPressed: () {
                Get.snackbar(
                  'Are you sure',
                  'This reservation will be cancelled. Tap to confirm',
                  isDismissible: false,
                  colorText: Colors.white,
                  maxWidth: 500,
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: colorBittersweet,
                  margin: const EdgeInsets.symmetric(vertical: 51),
                  onTap: (snack) async {
                    try {
                      await guestReservationQuery.update(
                        id: reservation.id,
                        isCancelled: true,
                      );
                      setState(() => cancelled = true);
                      Get.back();
                      successSnack(
                        'The reservation cancelled',
                        'The reservation cancelled without problems.',
                      );
                    } catch (e) {
                      errorSnack('Code error', e.toString());
                    }
                  },
                );
              },
            ),
        ],
      ),
    );
  }
}

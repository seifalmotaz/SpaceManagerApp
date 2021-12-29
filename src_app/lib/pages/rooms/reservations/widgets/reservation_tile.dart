import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/constants/error_snack.dart';
import 'package:spacemanager/models/reservations/src.dart';

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
    jiffyStart = Jiffy(reservation.startTime);
    jiffyEnd = Jiffy(reservation.endTime);
    super.initState();
    if (!reservation.startTime!.isAfter(DateTime.now())) {
      setState(() {
        passed = true;
      });
    }
    if (reservation.isCancelled!) {
      setState(() {
        cancelled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(13),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: passed
            ? BaseColors.primary
            : cancelled
                ? BaseColors.lightPrimary
                : Colors.white,
        borderRadius: BorderRadius.circular(13),
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
          if (cancelled)
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
                  maxWidth: Get.width * .3,
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: BaseColors.primary,
                  margin: const EdgeInsets.symmetric(vertical: 51),
                  onTap: (snack) async {
                    try {
                      reservation.isCancelled = false;
                      await reservation.update();
                      setState(() => cancelled = false);
                      Get.back();
                      Get.snackbar(
                        'The reservation continued',
                        'The reservation continued without problems.',
                        isDismissible: false,
                        colorText: Colors.black,
                        maxWidth: Get.width * .3,
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.greenAccent,
                        margin: const EdgeInsets.symmetric(vertical: 51),
                      );
                    } catch (e) {
                      errorSnack('Code error', e.toString());
                    }
                  },
                );
              },
            ),
          if (!cancelled)
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
                  maxWidth: Get.width * .3,
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: BaseColors.primary,
                  margin: const EdgeInsets.symmetric(vertical: 51),
                  onTap: (snack) async {
                    try {
                      reservation.isCancelled = true;
                      await reservation.update();
                      setState(() => cancelled = true);
                      Get.back();
                      Get.snackbar(
                        'The reservation cancelled',
                        'The reservation cancelled without problems.',
                        isDismissible: false,
                        colorText: Colors.black,
                        maxWidth: Get.width * .3,
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.greenAccent,
                        margin: const EdgeInsets.symmetric(vertical: 51),
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

import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/constants/settings.dart';

import 'package:spaceapp/pages/dashboard/controllers/controller.dart';
import 'package:xwidgets/xwidgets.dart';

class EndRoomScreenController extends GetxController {
  // calling func
  static EndRoomScreenController get to => Get.find();
  EndRoomScreenController(g, s) {
    guest = Rx<Guest>(g);
    session = Rx<RoomSession>(s);
    // form values
    name.text = guestValue.name ?? '';
    email.text = guestValue.email ?? '';
    phone.text = guestValue.phone ?? '';
    nationalId.text = guestValue.nationalId ?? '';
  }

  // ui vars
  RxBool isLoading = true.obs;
  RxBool priceHourly = true.obs;

  // helers
  final DateTime dateTime = DateTime.now();
  RxString sessionTimeM = ''.obs; // sessionTime in minutes
  RxString sessionTimeH = ''.obs; // sessionTime in hours
  RxInt totalPrice = 0.obs; // total price (Price.rate * Session.hours)

  // data
  late Rx<Guest> guest;
  Guest get guestValue => guest.value;

  late Rx<RoomSession> session;
  RoomSession get sessionValue => session.value;

  late Rx<Room> room;
  Room get roomValue => room.value;

  // guest form vars
  RxBool dataEdited = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController nationalId = TextEditingController();

  // custom price vars
  RxBool customPrice = false.obs;
  TextEditingController pricing = TextEditingController();

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      Room _room = await roomQuery.read(sessionValue.roomId);
      room = Rx<Room>(_room);
    } catch (e, s) {
      MonitoringApp.error(e, s);
    }
    // setting session time string
    setPrice(roomValue.rate.toInt().toString());

    isLoading.value = false;
  }

  endSession(Function start, Function stop, ButtonState state) async {
    start();
    MonitoringApp.errorTrack(() async {
      await roomSessionQuery.update(
        id: sessionValue.id,
        customPaid: customPrice.value,
        paidAmount: totalPrice.toDouble(),
        timeOut: dateTime,
      );
      Get.back(result: true);
      DashboardController.to.toMainPageUpdate();
    });
    stop();
  }

  setPrice(String? string) async {
    if (string == null || string.isEmpty) {
      totalPrice.value = 0;
      return;
    }

    if (!priceHourly.value && customPrice.value) {
      totalPrice.value = int.tryParse(string) ?? 0;
      return;
    } else {
      int? rate = int.tryParse(string);
      if (rate != null) {
        // setting session time string
        DateTimeRange range = DateTimeRange(
          start: sessionValue.timeIn,
          end: dateTime,
        );
        Duration rangeTime = range.duration;
        double i = rangeTime.inMinutes % 60;

        // set session time for ui
        sessionTimeH.value = rangeTime.inHours.toString();
        sessionTimeM.value = i.round().toString();

        // get total price
        int _totalPrice = 0;

        if (sessionValue.reservationId != null) {
          GuestReservation reservation = await sessionValue
              .guestReservationData(sessionValue.reservationId!);

          DateTimeRange resRange = DateTimeRange(
            start: reservation.timeIn,
            end: reservation.timeOut,
          );

          if (!customPrice.value) {
            if (reservation.isFullpayed) {
              totalPrice.value = 0;
              return;
            }
          }

          if ((resRange.duration.inMinutes + maxMinutes$Room) <
              rangeTime.inMinutes) {
            int mainHours = resRange.duration.inHours;
            int extraHours =
                ((rangeTime.inMinutes - resRange.duration.inMinutes) / 60)
                    .round();
            _totalPrice = _totalPrice + (mainHours * rate);

            int _rate = reservation.extraHoursPrice!.toInt();
            if (i < maxMinutes$Room) {
              _totalPrice = _totalPrice + (extraHours * _rate);
            } else {
              _totalPrice = _totalPrice + ((extraHours + 1) * _rate);
            }
          } else {
            if (i < maxMinutes$Room) {
              _totalPrice = _totalPrice + (rangeTime.inHours * rate);
            } else {
              _totalPrice = _totalPrice + ((rangeTime.inHours + 1) * rate);
            }
          }

          int total = (_totalPrice - reservation.paidAmount).round();
          if (!customPrice.value) totalPrice.value = total < 0 ? 0 : total;
          if (customPrice.value) totalPrice.value = _totalPrice;
        } else {
          if (i < maxMinutes$Room) {
            _totalPrice = _totalPrice + (rangeTime.inHours * rate);
          } else {
            _totalPrice = _totalPrice + ((rangeTime.inHours + 1) * rate);
          }
          totalPrice.value = _totalPrice;
        }
      }
    }
  }
}

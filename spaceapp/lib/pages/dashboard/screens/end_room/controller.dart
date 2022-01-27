import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/constants/limits.dart';
import 'package:spaceapp/helpers/monitoring.dart';
import 'package:spaceapp/pages/dashboard/controllers/controller.dart';
import 'package:spaceapp/pages/dashboard/controllers/searching.dart';

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
      SearchingController.to.searchingController.text = '';
      SearchingController.to.guests.value = [];
      SearchingController.to.searching.value = false;
      DashboardController.to.shortcutChildFocus.requestFocus();
    });
    stop();
  }

  setPrice(String? string) {
    if (string == null || string.isEmpty) {
      totalPrice.value = 0;
    }

    if (!priceHourly.value) {
      totalPrice.value = int.tryParse(string!) ?? 0;
    } else {
      int? rate = int.tryParse(string!);
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
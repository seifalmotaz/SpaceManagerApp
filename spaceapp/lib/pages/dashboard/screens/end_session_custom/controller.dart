import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/constants/settings.dart';

import 'package:spaceapp/pages/dashboard/controllers/controller.dart';
import 'package:spaceapp/pages/dashboard/controllers/searching.dart';
import 'package:xwidgets/xwidgets.dart';

class EndSessionScreenController$Custom extends GetxController {
  // calling func
  static EndSessionScreenController$Custom get to => Get.find();
  EndSessionScreenController$Custom(g, s) {
    guest = Rx<Guest>(g);
    session = Rx<GuestSession>(s);
    // form values
    name.text = guestValue.name ?? '';
    email.text = guestValue.email ?? '';
    phone.text = guestValue.phone ?? '';
    nationalId.text = guestValue.nationalId ?? '';
  }

  // ui vars
  GlobalKey<FormState> form = GlobalKey<FormState>();
  RxBool isLoading = true.obs;
  RxBool priceHourly = true.obs;

  // helers
  final DateTime dateTime = DateTime.now();
  RxString sessionTimeM = ''.obs; // sessionTime in minutes
  RxString sessionTimeH = ''.obs; // sessionTime in hours
  RxInt totalPrice = 0.obs; // total price (rate * Session.hours)

  // data
  late Rx<Guest> guest;
  Guest get guestValue => guest.value;

  late Rx<GuestSession> session;
  GuestSession get sessionValue => session.value;

  // guest form vars
  RxBool dataEdited = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController nationalId = TextEditingController();

  // custom price vars
  TextEditingController pricing = TextEditingController();

  init() => MonitoringApp.errorTrack(() async {
        // setting session time string
        DateTimeRange range = DateTimeRange(
          start: sessionValue.timeIn,
          end: dateTime,
        );
        Duration rangeTime = range.duration;
        sessionTimeH.value = rangeTime.inHours.toString();
        sessionTimeM.value = (rangeTime.inMinutes % 60).toString();

        isLoading.value = false;
      });

  Future<void> updateGuest() async {
    if (dataEdited.value) {
      int newGuest = await guestQuery.update(
        id: guestValue.id,
        name: (name.text).getStringIfChanged(guestValue.name),
        email: (email.text).getStringIfChanged(guestValue.email),
        phone: (phone.text).getStringIfChanged(guestValue.phone),
        nationalId: (nationalId.text).getStringIfChanged(guestValue.nationalId),
      );
      await guestQuery.read(newGuest);
    }
  }

  endSession(Function start, Function stop, ButtonState state) {
    start();
    if (form.currentState!.validate()) {
      MonitoringApp.errorTrack(() async {
        await updateGuest();
        await guestSessionQuery.update(
          id: sessionValue.id,
          paidAmount: totalPrice.value.toDouble(),
          timeOut: dateTime,
        );
        Get.back(result: true);
        SearchingController.to.searchingController.text = '';
        SearchingController.to.guests.value = [];
        SearchingController.to.searching.value = false;
        DashboardController.to.shortcutChildFocus.requestFocus();
      });
    }
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
        // get total price
        int _totalPrice = 0;
        double i = rangeTime.inMinutes % 60;
        if (i < maxMinutes$Session) {
          for (var i = 0; i < sessionValue.guestCount; i++) {
            _totalPrice = _totalPrice + (rangeTime.inHours * rate);
          }
        } else {
          for (var i = 0; i < sessionValue.guestCount; i++) {
            _totalPrice = _totalPrice + ((rangeTime.inHours + 1) * rate);
          }
        }
        totalPrice.value = _totalPrice;
      }
    }
  }

  @override
  void onReady() {
    init();
    super.onReady();
  }
}

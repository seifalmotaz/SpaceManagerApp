import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/constants/settings.dart';
import 'package:spaceapp/helpers/extention.dart';
import 'package:spaceapp/helpers/monitoring.dart';
import 'package:spaceapp/pages/dashboard/controllers/controller.dart';
import 'package:spaceapp/pages/dashboard/controllers/searching.dart';

class EndSessionScreenController extends GetxController {
  // calling func
  static EndSessionScreenController get to => Get.find();
  EndSessionScreenController(g, s) {
    guest = Rx<Guest>(g);
    session = Rx<GuestSession>(s);
    // form values
    name.text = guestValue.name ?? '';
    email.text = guestValue.email ?? '';
    phone.text = guestValue.phone ?? '';
    nationalId.text = guestValue.nationalId ?? '';
  }

  // ui vars
  RxBool isLoading = true.obs;

  // helers
  final DateTime dateTime = DateTime.now();
  RxString sessionTimeM = ''.obs; // sessionTime in minutes
  RxString sessionTimeH = ''.obs; // sessionTime in hours
  RxInt totalPrice = 0.obs; // total price (Price.rate * Session.hours)

  // data
  late Rx<Guest> guest;
  Guest get guestValue => guest.value;

  late Rx<GuestSession> session;
  GuestSession get sessionValue => session.value;

  late Rx<Price> price;
  Price get priceValue => price.value;

  // guest form vars
  RxBool dataEdited = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController nationalId = TextEditingController();

  // custom price vars
  RxBool customPrice = false.obs;
  RxBool priceHourly = true.obs;
  TextEditingController pricing = TextEditingController();

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

  endSession(Function start, Function stop, ButtonState state) async {
    start();
    await MonitoringApp.errorTrack(() async {
      await updateGuest();
      if (customPrice.value) {
        await DBService.to.db.update(
          'session',
          {
            'paid_amount': totalPrice.value.toDouble(),
            'time_out': (dateTime.millisecondsSinceEpoch / 1000).round(),
            'price_id': null,
            'custom_paid': 1,
          },
          where: 'id = ?',
          whereArgs: [sessionValue.id],
        );
      } else {
        await guestSessionQuery.update(
          id: sessionValue.id,
          paidAmount: totalPrice.value.toDouble(),
          timeOut: dateTime,
          customPaid: false,
        );
      }
      Get.back(result: true);
      SearchingController.to.searchingController.text = '';
      SearchingController.to.guests.value = [];
      SearchingController.to.searching.value = false;
      DashboardController.to.shortcutChildFocus.requestFocus();
    });
    stop();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await MonitoringApp.errorTrack(() async {
      Price _price = await priceQuery.read(sessionValue.priceId!);
      price = Rx<Price>(_price);
      setPrice(price.value.rate.toString());
    });
  }

  setPrice(String? string) {
    if (string == null || string.isEmpty) {
      totalPrice.value = 0;
      return;
    }

    if (!priceHourly.value) {
      totalPrice.value = int.tryParse(string) ?? 0;
      return;
    }

    // setting session time string
    DateTimeRange range = DateTimeRange(
      start: sessionValue.timeIn,
      end: dateTime,
    );
    Duration rangeTime = range.duration;
    sessionTimeH.value = rangeTime.inHours.toString();
    sessionTimeM.value = (rangeTime.inMinutes % 60).toString();
    // get total price
    double rate = double.parse(string);
    double _totalPrice = 0;
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
    totalPrice.value = _totalPrice.round();
    isLoading.value = false;
  }
}

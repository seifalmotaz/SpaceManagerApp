import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:spaceapp/pages/dashboard/controllers/controller.dart';
import 'package:spaceapp/pages/dashboard/controllers/searching.dart';
import 'package:spaceapp/services/guests.dart';
import 'package:spaceapp/widgets/xwidgets.dart';

import 'start_session.dart';

class StartSessionController extends GetxController {
  // calling func
  static StartSessionController get to => Get.find();

  StartSessionController(g) {
    guest = Rx<Guest>(g);
    name.text = guestValue.name ?? '';
    email.text = guestValue.email ?? '';
    phone.text = guestValue.phone ?? '';
    nationalId.text = guestValue.nationalId ?? '';
  }

  // vars
  RxBool isCustomRate = false.obs;
  RxBool dataEdited = false.obs; // if guest data edited
  final DateTime dateTime = DateTime.now();

  // pricing data
  RxList<Price> prices = <Price>[].obs;
  Rx<Price?> priceSelected = Rx<Price?>(null);
  Price? get priceSelectedValue => priceSelected.value;

  // data
  late Rx<Guest> guest;
  Guest get guestValue => guest.value;

  TextEditingController guestCount = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController nationalId = TextEditingController();

  getPrices() async {
    try {
      List<Price> _prices = await priceQuery.find(isDeleted: false);

      prices.value = _prices;
      for (Price item in _prices) {
        if (item.isDefault) {
          priceSelected.value = item;
        }
      }
    } catch (e, stackTrace) {
      MonitoringApp.error(e, stackTrace);
    }
  }

  Future<Guest> updateGuest() async {
    late Guest _guest;
    if (guestValue.id == 0) {
      int newGuest = await guestQuery.create(
        name: (name.text).getStringOrNull(),
        email: (email.text).getStringOrNull(),
        phone: (phone.text).getStringOrNull(),
        nationalId: (nationalId.text).getStringOrNull(),
      );

      try {
        _guest = await guestQuery.read(newGuest);
      } catch (e, s) {
        MonitoringApp.error(e, s);
      }
    } else if (dataEdited.value) {
      int newGuest = await guestQuery.update(
        id: guestValue.id,
        name: (name.text).getStringIfChanged(guestValue.name),
        email: (email.text).getStringIfChanged(guestValue.email),
        phone: (phone.text).getStringIfChanged(guestValue.phone),
        nationalId: (nationalId.text).getStringIfChanged(guestValue.nationalId),
      );

      try {
        _guest = await guestQuery.read(newGuest);
      } catch (e, s) {
        MonitoringApp.error(e, s);
      }
    } else {
      _guest = guestValue;
    }
    return _guest;
  }

  startSession(Function start, Function stop, ButtonState state) {
    start();
    MonitoringApp.errorTrack(() async {
      Guest _guest = await updateGuest();

      if (priceSelectedValue!.isPerDay) {
        await guestSessionQuery.create(
          guestId: _guest.id,
          customPaid: false,
          guestCount:
              int.tryParse((guestCount.text).getStringOrNull() ?? '') ?? 1,
          priceId: priceSelectedValue!.id,
          paidAmount: priceSelectedValue!.rate,
          timeIn: dateTime,
          timeOut: DateTime(
            dateTime.year,
            dateTime.month,
            dateTime.day,
            11,
            59,
            50,
          ).toUtc(),
        );
        await MemoryGuestsService.to.addGuest(_guest.id);
        Get.back(result: StartSessionResults(guest: _guest));
        SearchingController.to.searchingController.text = '';
        SearchingController.to.guests.value = [];
        SearchingController.to.searching.value = false;
        DashboardController.to.shortcutChildFocus.requestFocus();
      } else {
        int session = await guestSessionQuery.create(
          guestId: _guest.id,
          customPaid: isCustomRate.value,
          guestCount:
              int.tryParse((guestCount.text).getStringOrNull() ?? '') ?? 1,
          priceId: priceSelectedValue!.id,
        );
        Get.back(
          result: StartSessionResults(
            sessionId: session,
            guest: _guest,
          ),
        );
        SearchingController.to.searchingController.text = '';
        SearchingController.to.guests.value = [];
        SearchingController.to.searching.value = false;
        DashboardController.to.shortcutChildFocus.requestFocus();
      }
    });
    stop();
  }

  @override
  void onInit() {
    getPrices(); // get data list
    super.onInit();
  }
}

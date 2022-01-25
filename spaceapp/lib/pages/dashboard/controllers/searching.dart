import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/helpers/snacks.dart';

class SearchingController extends GetxController {
  static SearchingController get to => Get.find();

  // searching vars
  RxBool searching = false.obs;
  TextEditingController searchingController = TextEditingController();
  FocusNode searchingFocus = FocusNode();

  RxList<Guest$Session> guests = <Guest$Session>[].obs;

  searchPhone(String phone) async {
    try {
      List<Guest$Session> _guests = await guestQuery.findPhone$Session(phone);

      if (_guests.isNotEmpty) {
        guests.value = _guests;
        return;
      }

      Guest g = Guest(
        id: 0,
        isAdmin: false,
        isStaff: false,
        isExpired: false,
        phone: phone,
        createdDate: DateTime.now(),
      );

      guests.value = [Guest$Session(guest: g)];
    } catch (e) {
      codeError(e.toString(), const Duration(seconds: 7));
    }
  }

  searchEmail(String email) async {
    try {
      List<Guest$Session> _guests = await guestQuery.findEmail$Session(email);

      if (_guests.isNotEmpty) {
        guests.value = _guests;
        return;
      }

      Guest g = Guest(
        id: 0,
        isAdmin: false,
        isStaff: false,
        isExpired: false,
        email: email,
        createdDate: DateTime.now(),
      );

      guests.value = [Guest$Session(guest: g)];
    } catch (e) {
      codeError(e.toString(), const Duration(seconds: 7));
    }
  }
}

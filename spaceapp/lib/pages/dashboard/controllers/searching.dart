import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchingController extends GetxController {
  static SearchingController get to => Get.find();

  // searching vars
  RxBool searching = false.obs;
  TextEditingController searchingController = TextEditingController();
  FocusNode searchingFocus = FocusNode();

  RxList<Guest> guests = <Guest>[].obs;

  searchPhone(String phone) async {
    List<Guest> _guests = await guestQuery.findPhone(phone);

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
    if (_guests.isEmpty) guests.value = [g];
  }

  searchEmail(String email) async {
    List<Guest> _guests = await guestQuery.findEmail(email);

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
    if (_guests.isEmpty) guests.value = [g];
  }
}

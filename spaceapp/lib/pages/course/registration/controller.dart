import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/widgets/xwidgets.dart';

import 'package:spaceapp/pages/course/read/controller.dart';
import 'package:spaceapp/pages/guest/edit_guest.dart';

class CreateRegistrationController extends GetxController {
  // calling func
  static CreateRegistrationController get to => Get.find();

  Rxn<Guest> guest = Rxn<Guest>(null);
  RxList<Guest> guests = RxList<Guest>([]);

  // guest data
  TextEditingController phone = TextEditingController();
  // course data
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController totalPrice = TextEditingController();

  RxString selectedGroup = ''.obs;

  @override
  void onReady() {
    super.onReady();
    phone.addListener(readPhone);
  }

  Future readPhone() async {
    if (phone.text.isNotEmpty) {
      List<Guest> _guests = await guestQuery.findPhone(phone.text);
      if (_guests.isNotEmpty) {
        guests.value = _guests.take(3).toList();
      } else {
        guests.value = [];
        guest.value = Guest(
          id: 0,
          isAdmin: false,
          isExpired: false,
          isStaff: false,
          phone: phone.text,
          createdDate: DateTime(2001),
        );
        return;
      }
      return;
    } else {
      guests.value = [];
      return;
    }
  }

  add(startLoading, stopLoading, ButtonState btnState) async {
    startLoading();
    if (guest.value == null) {
      errorSnack('guest not found', 'Please choose guest');
      stopLoading();
      return;
    }

    Guest _guest = guest.value!;

    create() async {
      await courseRegistrationQuery.create(
        guestId: _guest.id,
        courseId: ReadCourseController.to.course.id,
        reservationsPrimaryName: selectedGroup.value,
        isPaid: true,
        createdDate: DateTime.now(),
      );
      Get.back();
    }

    if (_guest.id == 0) {
      Get.snackbar(
        'New guest',
        'This guest is new.',
        isDismissible: true,
        colorText: colorDarkLight,
        maxWidth: 500,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 51),
        mainButton: TextButton(
          child: const Text(
            'Edit',
            style: TextStyle(
              color: colorDarkLight,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          onPressed: () async {
            await Get.dialog(EditGuestScreen(
              guest: _guest,
              onSave: (g) {
                _guest = g;
                Get.back();
              },
            ));
            await create();
            stopLoading();
          },
        ),
      );
      return;
    }

    await create();
    ReadCourseController.to.resetData();
    stopLoading();
    return;
  }
}

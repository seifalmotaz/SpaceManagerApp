import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xwidgets/xwidgets.dart';
import 'package:spaceapp/pages/course/list/controller.dart';
import 'package:spaceapp/pages/guest/edit_guest.dart';

class CreateCourseController extends GetxController {
  Rxn<Guest> lecturer = Rxn<Guest>(null);
  RxList<Guest> lecturers = RxList<Guest>([]);

  // lecturer data
  TextEditingController phone = TextEditingController();
  // course data
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController totalPrice = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    phone.addListener(readPhone);
  }

  Future readPhone() async {
    if (phone.text.isNotEmpty) {
      List<Guest> _lecturers = await guestQuery.findPhone(phone.text);
      if (_lecturers.isNotEmpty) {
        lecturers.value = _lecturers.take(3).toList();
      } else {
        lecturers.value = [];
        lecturer.value = Guest(
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
      lecturers.value = [];
      return;
    }
  }

  addCourse(startLoading, stopLoading, ButtonState btnState) async {
    startLoading();
    if (lecturer.value == null) {
      errorSnack('Lecturer not found', 'Please choose lecturer');
      stopLoading();
      return;
    }

    Guest guest = lecturer.value!;

    create() async {
      await courseQuery.create(
        name: name.text,
        lecturerId: guest.id,
        description: description.text,
        totalPrice: double.parse(totalPrice.text),
      );
      Get.back();
    }

    if (guest.id == 0) {
      Get.snackbar(
        'New guest',
        'This guest is new.',
        isDismissible: true,
        colorText: colorDarkLight,
        maxWidth: Get.width * .3,
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
              guest: guest,
              onSave: (_guest) {
                guest = _guest;
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
    CoursesListController.to.resetData();
    stopLoading();
    return;
  }
}

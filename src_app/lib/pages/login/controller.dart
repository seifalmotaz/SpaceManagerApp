import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/models/sessions/src.dart';
import 'package:spacemanager/pages/home/home.dart';
import 'package:spacemanager/services/auth.dart';

class LoginController extends GetxController {
  FocusNode phoneFocus = FocusNode();
  FocusNode passFocus = FocusNode();

  TextEditingController phone = TextEditingController();
  TextEditingController pass = TextEditingController();

  login() async {
    Guest? guest = await GuestFindQuery.getOneByPhone(phone.text);
    if (guest == null || guest.isStaff != true) {
      errorSnack('Login error', 'Password or Phone not correct');
      return;
    }

    bool match = Crypt(guest.password!).match(pass.text);
    if (!match) {
      errorSnack('Password error', 'Password is not correct');
      return;
    }

    try {
      AuthService.to.guestData.value = guest;
      Session sessionId = Session(guestId: guest.id);
      int start = await sessionId.start();
      AuthService.to.sessionData.value = await SessionQuery.read(start);
      AuthService.to.isAuthenticated.value = true;
      Get.offAll(() => const HomePage());
    } catch (e) {
      errorSnack('Code error', e.toString());
      return;
    }
  }

  errorSnack(t, m) {
    return Get.snackbar(
      t,
      m,
      isDismissible: false,
      colorText: Colors.white,
      maxWidth: Get.width * .3,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: BaseColors.primary,
      margin: const EdgeInsets.symmetric(vertical: 51),
    );
  }
}

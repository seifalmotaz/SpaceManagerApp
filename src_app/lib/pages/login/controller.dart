import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  FocusNode phoneFocus = FocusNode();
  FocusNode passFocus = FocusNode();

  TextEditingController phone = TextEditingController();
  TextEditingController pass = TextEditingController();

  // login() async {
  //   Guest? guest = await DBService.to.db.getGuestsWherePhone(phone.text);
  //   if (guest == null || guest.isStaff != true) {
  //     errorSnack('Login error', 'Password or Phone not correct');
  //     return;
  //   }

  //   bool match = Crypt(guest.password!).match(pass.text);
  //   if (!match) {
  //     errorSnack('Password error', 'Password is not correct');
  //     return;
  //   }

  //   try {
  //     AuthService.to.guestData.value = guest;
  //     int sessionId = await DBService.to.db.insertSession(
  //         SessionsCompanion.insert(guestsCount: 1, guestId: guest.id));
  //     AuthService.to.sessionData.value =
  //         await DBService.to.db.getSession(sessionId);
  //     AuthService.to.isAuthenticated.value = true;
  //     Get.offAll(() => const HomePage());
  //   } catch (e) {
  //     errorSnack('Code error', e.toString());
  //     return;
  //   }
  // }

  // errorSnack(t, m) {
  //   return Get.snackbar(
  //     t,
  //     m,
  //     isDismissible: false,
  //     colorText: Colors.white,
  //     maxWidth: Get.width * .3,
  //     snackPosition: SnackPosition.BOTTOM,
  //     backgroundColor: BaseColors.primary,
  //     margin: const EdgeInsets.symmetric(vertical: 51),
  //   );
  // }
}

import 'package:get/get.dart';

class AuthService extends GetxService {
  // Calling func
  static AuthService get to => Get.find();
  //
  RxBool isAuthenticated = false.obs;
  //
  // Rx<Guest?> guestData = Rx<Guest?>(null);
  // Guest? get guest => guestData.value;
  // //
  // Rx<Session?> sessionData = Rx<Session?>(null);
  // Session? get session => sessionData.value;
}

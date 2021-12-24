import 'package:get/get.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/models/sessions/src.dart';

class AuthService extends GetxService {
  // Calling func
  static AuthService get to => Get.find();
  //
  RxBool isAuthenticated = false.obs;
  //
  Rx<Guest?> guestData = Rx<Guest?>(null);
  Guest? get guest => guestData.value;
  //
  Rx<Session?> sessionData = Rx<Session?>(null);
  Session? get session => sessionData.value;

  updateGuestData() async {
    guestData.value = await GuestCRUDQuery.read(guest!.id!);
  }
}

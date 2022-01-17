import 'package:database_system/database_system.dart';
import 'package:get/get.dart';
// import 'package:spacemanager/models/guests/src.dart';
// import 'package:spacemanager/models/sessions/src.dart';

class AuthService extends GetxService {
  // Calling func
  static AuthService get to => Get.find();
  //
  bool get isAuthenticated => guest != null && session != null;
  //
  Rx<Guest?> guestData = Rx<Guest?>(null);
  Guest? get guest => guestData.value;
  //
  Rx<StaffSession?> sessionData = Rx<StaffSession?>(null);
  StaffSession? get session => sessionData.value;

  updateGuestData() async {
    guestData.value = await guestQuery.read(guest!.id);
  }
}

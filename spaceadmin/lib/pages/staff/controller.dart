import 'package:database_system/database_system.dart';
import 'package:get/get.dart';

class StaffController extends GetxController {
  static StaffController get to => Get.find();

  RxList<Guest> staff = RxList<Guest>();

  @override
  void onReady() {
    getData();
    super.onReady();
  }

  getData() async =>
      staff.value = await guestQuery.find(isStaff: true, isExpired: false);
}

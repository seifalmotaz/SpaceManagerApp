import 'package:database_system/database_system.dart';
import 'package:get/get.dart';

class RoomsManagementController extends GetxController {
  static RoomsManagementController get to => Get.find();

  RxList<Room> rooms = RxList<Room>();

  getRooms() async {
    List<Room> _rooms = await roomQuery.find();
    rooms.value = _rooms;
  }

  @override
  void onReady() {
    getRooms();
    super.onReady();
  }
}

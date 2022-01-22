import 'package:database_system/database_system.dart';
import 'package:get/get.dart';

class RoomsController extends GetxController {
  static RoomsController get to => Get.find();

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

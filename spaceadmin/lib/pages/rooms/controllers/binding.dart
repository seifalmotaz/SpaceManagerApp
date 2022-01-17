import 'package:get/get.dart';

import 'controller.dart';

class RoomsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<RoomsController>(RoomsController());
  }
}

import 'package:get/get.dart';
import 'package:spaceadmin/pages/rooms/rooms.dart';

import 'controller.dart';

class RoomsBinding implements Bindings {
  static Future? get to => Get.to(
        () => const RoomsPage(),
        binding: RoomsBinding(),
      );

  static Future? get off => Get.off(
        () => const RoomsPage(),
        binding: RoomsBinding(),
      );

  @override
  void dependencies() {
    Get.put<RoomsController>(RoomsController());
  }
}

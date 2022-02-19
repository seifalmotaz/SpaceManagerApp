import 'package:get/get.dart';
import 'package:spaceadmin/pages/prices/prices.dart';

import 'controller.dart';

class PricesBinding implements Bindings {
  static Future? get to => Get.to(
        () => const PricesPage(),
        binding: PricesBinding(),
      );

  static Future? get off => Get.off(
        () => const PricesPage(),
        binding: PricesBinding(),
      );

  @override
  void dependencies() {
    Get.put<PricesController>(PricesController());
  }
}

import 'package:database_system/database_system.dart';
import 'package:get/get.dart';

class PricesManagementController extends GetxController {
  static PricesManagementController get to => Get.find();

  RxList<Price> prices = RxList<Price>();

  getPrices() async {
    List<Price> _prices = await priceQuery.find();
    prices.value = _prices;
  }

  @override
  void onReady() {
    getPrices();
    super.onReady();
  }
}

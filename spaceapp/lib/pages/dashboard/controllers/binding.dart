import 'package:get/get.dart';
import 'package:spaceapp/pages/dashboard/controllers/spaces.dart';

import 'controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(DashboardController());
    Get.put<SpacesScreenController>(SpacesScreenController());
  }
}

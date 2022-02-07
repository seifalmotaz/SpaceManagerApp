import 'package:database_system/database_system.dart';
import 'package:get/get.dart';

class CoursesListController extends GetxController {
  static CoursesListController get to => Get.find();

  RxList<Course> courses = RxList<Course>([]);

  @override
  void onReady() {
    resetData();
    super.onReady();
  }

  resetData() async {
    courses.value = await courseQuery.find(isDeleted: false);
  }
}

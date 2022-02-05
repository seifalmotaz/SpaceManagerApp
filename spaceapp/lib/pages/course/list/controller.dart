import 'package:database_system/database_system.dart';
import 'package:get/get.dart';

class CoursesListController extends GetxController {
  RxList<Course> courses = RxList<Course>([]);

  @override
  Future<void> onReady() async {
    super.onReady();
    courses.value = await courseQuery.find(isDeleted: false);
  }
}

import 'package:spacemanager/models/reservations/src.dart';

import 'controller.dart';

extension Courses on HomeController {
  getCoursesReservations() async {
    List<ReservationWithCourse> list =
        await ReservationJoinsQuery.getByTodayCourses();
    courses.value = list;
  }
}

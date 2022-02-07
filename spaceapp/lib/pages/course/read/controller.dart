import 'package:database_system/database_system.dart';
import 'package:get/get.dart';

class ReservationsGroup {}

class ReadCourseController extends GetxController {
  final Course course;
  ReadCourseController(this.course);

  Rxn<Guest> guest = Rxn<Guest>();
  Guest? get guest_ => guest.value;

  RxList<ReservationsGroup> groups = <ReservationsGroup>[].obs;
  List<ReservationsGroup> get groups_ => groups.value;

  RxList<CourseReservation> reservations = <CourseReservation>[].obs;
  List<CourseReservation> get reservations_ => reservations.value;

  @override
  void onReady() {
    super.onReady();
    resetData();
  }

  resetData() async {
    guest.value = await guestQuery.read(course.lecturerId);
    reservations.value = await courseReservationQuery.find(courseId: course.id);
  }
}

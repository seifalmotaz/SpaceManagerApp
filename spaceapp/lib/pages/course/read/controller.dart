import 'package:database_system/database_system.dart';
import 'package:get/get.dart';

class ReservationsGroup {
  final String title;
  final int count;
  ReservationsGroup(this.title, this.count);
}

class ReadCourseController extends GetxController {
  final Course course;
  ReadCourseController(this.course);

  Rxn<ReservationsGroup> selectedGroup = Rxn<ReservationsGroup>();
  ReservationsGroup? get selectedGroup_ => selectedGroup.value;

  RxList<CourseReservation> selectedReservations = <CourseReservation>[].obs;
  List<CourseReservation> get selectedReservations_ =>
      selectedReservations.value;

  Rxn<Guest> guest = Rxn<Guest>();
  Guest? get guest_ => guest.value;

  RxList<ReservationsGroup> groups = <ReservationsGroup>[].obs;
  List<ReservationsGroup> get groups_ => groups.value;

  RxList<CourseReservation> reservations = <CourseReservation>[].obs;
  List<CourseReservation> get reservations_ => reservations.value;

  resetData() async {
    guest.value = await guestQuery.read(course.lecturerId);
    reservations.value = await courseReservationQuery.find(courseId: course.id);

    List<String> listString = [];
    for (CourseReservation reservation in reservations_) {
      if (!listString.contains(reservation.primaryName)) {
        listString.add(reservation.primaryName);
      }
    }

    List<ReservationsGroup> list = [];
    for (String item in listString) {
      int count = reservations_.where((e) => e.primaryName == item).length;
      list.add(ReservationsGroup(item, count));
    }

    groups.value = list;
  }

  @override
  void onReady() {
    super.onReady();
    resetData();
  }
}

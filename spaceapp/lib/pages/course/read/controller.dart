import 'package:database_system/database_system.dart';
import 'package:get/get.dart';

class ReservationsGroup {
  final String title;
  final int count;
  ReservationsGroup(this.title, this.count);
}

class ReadCourseController extends GetxController {
  // calling func
  static ReadCourseController get to => Get.find();

  final Course course;
  ReadCourseController(this.course);

  RxInt currentPage = 0.obs;

  Rxn<ReservationsGroup> selectedGroup = Rxn<ReservationsGroup>();
  ReservationsGroup? get selectedGroup_ => selectedGroup.value;

  RxList<CourseReservation> selectedReservations = <CourseReservation>[].obs;
  List<CourseReservation> get selectedReservations_ =>
      selectedReservations.value;

  // Rxn<Guest> guest = Rxn<Guest>();
  // Guest? get guest_ => guest.value;

  RxList<ReservationsGroup> groups = <ReservationsGroup>[].obs;
  List<ReservationsGroup> get groups_ => groups.value;
  List<ReservationsGroup> get notEndedGroups {
    DateTime dateTime = DateTime.now();
    List<ReservationsGroup> list = [];

    for (ReservationsGroup item in groups_) {
      bool ended = true;
      List<CourseReservation> data =
          reservations_.where((e) => e.group == item.title).toList();
      for (CourseReservation i in data) {
        if (!i.timeOut.isBefore(dateTime)) {
          ended = false;
        }
      }
      if (!ended) {
        list.add(item);
      }
    }

    return list;
  }

  RxList<CourseReservation> reservations = <CourseReservation>[].obs;
  List<CourseReservation> get reservations_ => reservations.value;

  resetData() async {
    List<CourseReservation> _reservations =
        await courseReservationQuery.find(courseId: course.id);
    _reservations.sort((a, b) {
      return b.timeIn.compareTo(a.timeIn);
    });
    reservations.value = _reservations;

    List<String> listString = [];
    for (CourseReservation reservation in reservations_) {
      if (!listString.contains(reservation.group)) {
        listString.add(reservation.group);
      }
    }

    List<ReservationsGroup> list = [];
    for (String item in listString) {
      int count = reservations_.where((e) => e.group == item).length;
      list.add(ReservationsGroup(item, count));
    }

    groups.value = list;

    guests.value = await courseRegistrationQuery.findForCourse(course.id);
  }

  @override
  void onReady() {
    super.onReady();
    resetData();
  }

  RxList<CourseRegistration> guests = <CourseRegistration>[].obs;
  List<CourseRegistration> get guests_ => guests.value;
}

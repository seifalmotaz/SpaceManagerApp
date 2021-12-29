import 'package:get/get.dart';
import 'package:spacemanager/models/courses/src.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/models/reservations/model.dart';
import 'package:spacemanager/models/reservations/query.dart';

class ReservationsController extends GetxController {
  ReservationsController(GuestWithSession? g, Course? c) {
    guest.value = g;
    course.value = c;
  }

  Rx<GuestWithSession?> guest = Rx<GuestWithSession?>(null);
  GuestWithSession? get guestData => guest.value;
  Rx<Course?> course = Rx<Course?>(null);
  Course? get courseData => course.value;
  RxList<Reservation> reservations = RxList<Reservation>();

  getData() {
    if (guest.value != null) getGuestData();
    if (course.value != null) getCourseData();
  }

  getCourseData() async {
    List<Reservation> list =
        await ReservationQuery.getByCourse(course.value!.id!);
    reservations.value = list;
  }

  getGuestData() async {
    List<Reservation> list =
        await ReservationQuery.getByGuest(guestData!.guest.id!);
    reservations.value = list;
  }

  @override
  void onReady() {
    getData();
    super.onReady();
  }
}

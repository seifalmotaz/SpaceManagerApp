import 'package:database_system/database_system.dart';
import 'package:get/get.dart';

class ReservationsGroup {
  final String title;
  final int count;
  ReservationsGroup(this.title, this.count);
}

class ReadGuestController extends GetxController {
  final int guestId;
  ReadGuestController(this.guestId);

  Rxn<Guest> guest = Rxn<Guest>();
  Guest? get guest_ => guest.value;

  RxList<GuestReservation> reservations = <GuestReservation>[].obs;
  List<GuestReservation> get reservations_ => reservations.value;

  RxList<ReservationsGroup> groups = <ReservationsGroup>[].obs;
  List<ReservationsGroup> get groups_ => groups.value;

  Rxn<ReservationsGroup> selectedGroup = Rxn<ReservationsGroup>();
  ReservationsGroup? get selectedGroup_ => selectedGroup.value;

  RxList<GuestReservation> selectedReservations = <GuestReservation>[].obs;
  List<GuestReservation> get selectedReservations_ =>
      selectedReservations.value;

  @override
  void onReady() {
    resetData();
    super.onReady();
  }

  resetData() async {
    guest.value = await guestQuery.read(guestId);
    List<GuestReservation> _reservations =
        await guestReservationQuery.find(guestId: guestId);
    _reservations.sort((a, b) {
      return b.timeIn.compareTo(a.timeIn);
    });
    reservations.value = _reservations;

    List<String> listString = [];
    for (GuestReservation reservation in reservations_) {
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
}

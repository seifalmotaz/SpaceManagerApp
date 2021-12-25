import 'package:spacemanager/models/reservations/model.dart';
import 'package:spacemanager/models/sessions/joins_classes.dart';
import 'package:spacemanager/models/reservations/joins_classes.dart';
import 'package:spacemanager/models/rooms/model.dart';

class RoomWithReservations {
  final Room room;
  final ReservationWithSessionWithGuest? running;
  final List<Reservation>? reservations;

  RoomWithReservations({
    required this.room,
    this.reservations,
    this.running,
  });
}

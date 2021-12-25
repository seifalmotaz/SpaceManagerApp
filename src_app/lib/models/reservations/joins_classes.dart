import 'model.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/models/sessions/joins_classes.dart';

class ReservationWithSessionWithGuest {
  final SessionWithGuest? session;
  final Reservation reservation;
  ReservationWithSessionWithGuest({
    required this.reservation,
    this.session,
  });
}

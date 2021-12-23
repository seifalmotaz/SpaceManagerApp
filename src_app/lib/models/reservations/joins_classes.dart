import 'package:spacemanager/models/reservations/model.dart';
import 'package:spacemanager/models/sessions/model.dart';

class ReservationWithSession {
  int? sessionId;
  Session? session;
  Reservation reservation;
  ReservationWithSession({
    this.sessionId,
    this.session,
    required this.reservation,
  });
}

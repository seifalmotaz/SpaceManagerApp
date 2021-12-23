import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/models/sessions/model.dart';

class SessionWithGuest {
  int? guestId;
  Guest? guest;
  Session session;
  SessionWithGuest({
    this.guestId,
    this.guest,
    required this.session,
  });
}

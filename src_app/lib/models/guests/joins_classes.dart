import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/models/sessions/src.dart';

class GuestWithSession {
  final int? sessionId;
  final Session? session;
  final Guest guest;
  GuestWithSession({
    this.session,
    this.sessionId,
    required this.guest,
  });
}

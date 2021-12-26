import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/models/sessions/src.dart';

class GuestWithSession {
  int? sessionId;
  Session? session;
  Guest guest;
  GuestWithSession({
    this.session,
    this.sessionId,
    required this.guest,
  });

  Future<Session> get fullSession async =>
      await SessionQuery.read(sessionId ?? session!.id!);
}

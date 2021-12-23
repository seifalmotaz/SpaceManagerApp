import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/models/sessions/joins_classes.dart';
import 'package:spacemanager/models/sessions/model.dart';
import 'package:spacemanager/services/database.dart';

extension FindQuery on Session {
  /// find last session not ended for guest
  static Future<Session?> findNotEndedForGuest(int userId) async {
    List<Map<String, dynamic>> data = await DBService.to.db.query(
      'sessions',
      where: 'user_id = ? AND end_time IS NULL',
      whereArgs: [userId],
    );
    return data.isNotEmpty ? Session.fromJson(data.first) : null;
  }

  Future<List<SessionWithGuest>> findAllNotEndedWithGuest() async {
    List<Map<String, dynamic>> data = await DBService.to.db.rawQuery("""
    SELECT sessions.*,
    guests.phone AS guest_phone,
    guests.email AS guest_email,
    guests.id AS guest_id,
    FROM sessions
    INNER JOIN users ON sessions.guest_id = guests.id
    WHERE end_time IS NULL AND guests.is_staff = false AND room_id IS NULL AND course_id IS NULL
    """);
    return data
        .map((e) => SessionWithGuest(
              session: Session.fromJson(e),
              guestId: e['guest_id'],
              guest: Guest(
                id: e['guest_id'],
                phone: e['guest_phone'],
                email: e['guest_email'],
              ),
            ))
        .toList();
  }
}
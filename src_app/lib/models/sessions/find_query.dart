import 'package:spacemanager/models/courses/src.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/models/reservations/src.dart';
import 'package:spacemanager/models/sessions/joins_classes.dart';
import 'package:spacemanager/models/sessions/model.dart';
import 'package:spacemanager/services/database.dart';
import 'package:spacemanager/constants/func.dart';

extension SessionFindQuery on Session {
  /// find last session not ended for guest
  static Future<Session?> findNotEndedForGuest(int userId) async {
    List<Map<String, dynamic>> data = await DBService.to.db.query(
      'sessions',
      where: 'guest_id = ? AND end_time IS NULL',
      whereArgs: [userId],
    );
    return data.isNotEmpty ? Session.fromMap(data.first) : null;
  }

  static Future<Session?> findNotEndedForStaff() async {
    List<Map<String, dynamic>> data = await DBService.to.db.rawQuery("""
    SELECT sessions.*
    FROM sessions
    INNER JOIN guests ON sessions.guest_id = guests.id
    WHERE end_time IS NULL AND guests.is_staff = true 
    LIMIT 1
    """);
    return data.isEmpty ? null : Session.fromMap(data.first);
  }

  static Future<int> findAllNotEndedWithGuestNum() async {
    List<Map<String, dynamic>> data = await DBService.to.db.rawQuery("""
    SELECT sessions.guests_count
    FROM sessions
    WHERE end_time IS NULL
    """);
    int _total = 0;
    for (var item in data) {
      _total += item['guests_count'] as int;
    }
    return _total;
  }

  static Future<ReservationWithSessionWithGuest?> findNotEndedWithRoom(
      int roomId) async {
    List<Map<String, dynamic>> data = await DBService.to.db.rawQuery("""
    SELECT sessions.*, 
    guests.phone AS guest_phone, guests.name AS guest_name,
    reservations.start_time AS reservation_start_time,
    reservations.end_time AS reservation_end_time,
    reservations.course_id AS reservation_course_id
    FROM sessions
    INNER JOIN rooms ON sessions.room_id = rooms.id
    LEFT JOIN guests ON sessions.guest_id = guests.id
    LEFT JOIN reservations ON sessions.reservation_id = reservations.id
    WHERE
    sessions.end_time IS NULL
    AND sessions.room_id = $roomId
    LIMIT 1
    """);
    if (data.isNotEmpty) {
      return ReservationWithSessionWithGuest(
        session: SessionWithGuest(
          session: Session.fromMap(data.first),
          guestId: data.first['guest_id'],
          guest: Guest.fromMap(getDataStartWithString_('guest', data.first)),
        ),
        reservation: Reservation.fromMap(
          getDataStartWithString_('reservation', data.first),
        ),
      );
    }
  }

  static Future<List<SessionWithCourse>> findCoursesThatJustEnded() async {
    DateTime now = DateTime.now();
    DateTime afterDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      now.hour,
      now.minute,
    ).subtract(const Duration(minutes: 30)).toUtc();

    DateTime beforeDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      now.hour,
      now.minute,
    ).add(const Duration(minutes: 15)).toUtc();

    List<Map<String, dynamic>> data = await DBService.to.db.rawQuery("""
    SELECT sessions.*, 
    courses.name AS course_name, 
    courses.rate AS course_rate,
    COUNT(bills.id) AS bills_count
    FROM sessions
    INNER JOIN courses ON sessions.course_id = courses.id
    LEFT JOIN bills ON sessions.id = bills.session_id 
    WHERE
    sessions.end_time IS NOT NULL
    AND sessions.course_id IS NOT NULL
    AND
    sessions.end_time BETWEEN "${afterDateTime.toIso8601String()}" AND "${beforeDateTime.toIso8601String()}"
    GROUP BY sessions.id
    HAVING  bills_count < sessions.guests_count
    """);
    return data
        .map((e) => SessionWithCourse(
              session: Session.fromMap(e),
              course: Course.fromMap(getDataStartWithString_('course', e)),
              courseId: e['course_id'],
              roomId: e['room_id'],
              billsCount: e['bills_count'],
            ))
        .toList();
  }
}

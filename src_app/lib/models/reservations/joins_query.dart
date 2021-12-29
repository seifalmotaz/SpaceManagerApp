import 'package:spacemanager/models/courses/model.dart';
import 'package:spacemanager/models/reservations/model.dart';
import 'package:spacemanager/models/guests/model.dart';
import 'package:spacemanager/services/database.dart';
import 'package:spacemanager/constants/func.dart';

import 'joins_classes.dart';

extension ReservationJoinsQuery on Reservation {
  /// Get spacific room reservation for today as default
  /// return reservation and session id
  static Future<List<ReservationWithGuest>> getByDateAndRoom(
    int roomId, {
    int? limit,
    bool isCourse = true,
    DateTime? selectedAfterDateTime,
    DateTime? selectedBeforeDateTime,
  }) async {
    DateTime now = DateTime.now();
    DateTime afterDateTime = selectedAfterDateTime?.toUtc() ??
        DateTime(now.year, now.month, now.day, now.hour, now.minute).toUtc();
    DateTime beforeDateTime = selectedBeforeDateTime?.toUtc() ??
        DateTime(now.year, now.month, now.day)
            .add(const Duration(hours: 24))
            .toUtc();

    List<Map<String, dynamic>> data = await DBService.to.db.rawQuery("""
    SELECT 
    reservations.*,
    sessions.session_id,
    guests.id AS guest_id,
    guests.email AS guest_email,
    guests.phone AS guest_phone,
    guests.name AS guest_name,
    guests.national_id AS guest_national_id
    FROM reservations
    LEFT JOIN guests ON reservations.guest_id = guests.id
    LEFT JOIN (
      SELECT id AS session_id, reservation_id, end_time AS endTime FROM sessions WHERE endTime IS NULL
    ) sessions ON reservations.id = sessions.reservation_id
    WHERE
    (
      start_time BETWEEN "${afterDateTime.toIso8601String()}" AND "${beforeDateTime.toIso8601String()}"
      OR
      end_time BETWEEN "${afterDateTime.toIso8601String()}" AND "${beforeDateTime.toIso8601String()}"
    )
    AND
    sessions.session_id IS NULL
    AND
    reservations.room_id = $roomId
    AND
    reservations.is_cancelled = false
    ${!isCourse ? 'AND reservations.course_id IS NULL' : ''}


    ORDER BY start_time ASC
    ${limit == null ? '' : 'LIMIT $limit'}   
    """);
    List<ReservationWithGuest> list = data
        .map((e) => ReservationWithGuest(
            reservation: Reservation.fromMap(e),
            guest: Guest.fromMap(getDataStartWithString_('guest', e))))
        .toList();
    return list;
  }

  static Future<List<ReservationWithCourse>> getByTodayCourses() async {
    DateTime now = DateTime.now();
    DateTime afterDateTime =
        DateTime(now.year, now.month, now.day, now.hour, now.minute).toUtc();

    DateTime beforeDateTime = DateTime(now.year, now.month, now.day)
        .add(const Duration(hours: 24))
        .toUtc();

    List<Map<String, dynamic>> data = await DBService.to.db.rawQuery("""
    SELECT
    reservations.*,
    sessions.session_id,
    courses.id AS course_id,
    courses.rate AS course_rate,
    courses.name AS course_name,
    courses.capacity AS course_capacity,
    rooms.id AS room_id,
    rooms.name AS room_name
    FROM reservations
    INNER JOIN courses ON reservations.course_id = courses.id
    INNER JOIN rooms ON reservations.room_id = rooms.id
    LEFT JOIN (
      SELECT id AS session_id, reservation_id, end_time AS endTime FROM sessions
    ) sessions ON reservations.id = sessions.reservation_id
    WHERE
    reservations.course_id IS NOT NULL
    AND
    sessions.session_id IS NULL
    AND
    reservations.is_cancelled = false
    AND
    (
      start_time BETWEEN "${afterDateTime.toIso8601String()}" AND "${beforeDateTime.toIso8601String()}"
      OR
      end_time BETWEEN "${afterDateTime.toIso8601String()}" AND "${beforeDateTime.toIso8601String()}"
    )
    ORDER BY start_time ASC 
    """);
    List<ReservationWithCourse> list = data
        .map(
          (e) => ReservationWithCourse(
              reservation: Reservation.fromMap(e),
              roomId: e['room_id'],
              roomName: e['room_name'],
              course: Course.fromMap(getDataStartWithString_('course', e))),
        )
        .toList();
    return list;
  }
}

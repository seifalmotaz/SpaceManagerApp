import 'package:spacemanager/models/reservations/model.dart';
import 'package:spacemanager/services/database.dart';

import 'joins_classes.dart';

extension JoinsQuery on Reservation {
  /// Get spacific room reservation for today
  /// return reservation and session id
  static Future<List<ReservationWithSession>> getByDateAndRoom(int roomId,
      [int? limit]) async {
    DateTime afterDateTime = DateTime.now();
    DateTime beforeDateTime = DateTime(
      afterDateTime.year,
      afterDateTime.month,
      afterDateTime.day + 1,
      2,
    );

    List<Map<String, dynamic>> data = await DBService.to.db.rawQuery("""
    SELECT reservations.*, sessions.session_id FROM reservations
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


    ORDER BY start_time ASC
    ${limit == null ? '' : 'LIMIT $limit'}   
    """);

    return data
        .map((e) => ReservationWithSession(
              reservation: Reservation.fromMap(e),
              sessionId: e['session_id'],
            ))
        .toList();
  }
}

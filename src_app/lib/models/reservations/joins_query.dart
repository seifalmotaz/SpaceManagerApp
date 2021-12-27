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
    DateTime? selectedAfterDateTime,
    DateTime? selectedBeforeDateTime,
  }) async {
    DateTime now = DateTime.now();
    DateTime afterDateTime = selectedAfterDateTime?.toUtc() ??
        DateTime(now.year, now.month, now.day, now.hour, now.minute).toUtc();
    DateTime beforeDateTime = selectedBeforeDateTime?.toUtc() ??
        afterDateTime.add(const Duration(hours: 2, days: 1)).toUtc();

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


    ORDER BY start_time ASC
    ${limit == null ? '' : 'LIMIT $limit'}   
    """);
    List<ReservationWithGuest> list = data
        .map((e) => ReservationWithGuest(
            reservation: Reservation.fromMap(e),
            guest: Guest.fromMap(getDataStartWithString_('guest', data.first))))
        .toList();
    return list;
  }
}

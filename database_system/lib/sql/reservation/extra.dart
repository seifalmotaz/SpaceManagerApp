import 'package:database_system/database_system.dart';
import 'package:sqflite_common/sqlite_api.dart';

class ReservationQuery {
  final Database db;
  ReservationQuery(this.db);

  Future<List<dynamic>> readRoom(
    int roomId, {
    DateTime? selectedAfterDateTime,
    DateTime? selectedBeforeDateTime,
  }) async {
    DateTime now = DateTime.now();
    DateTime afterDateTime = selectedAfterDateTime?.toUtc() ??
        DateTime(now.year, now.month, now.day, now.hour, now.minute).toUtc();
    DateTime beforeDateTime = selectedBeforeDateTime?.toUtc() ??
        DateTime(now.year, now.month, now.day)
            .add(const Duration(days: 360))
            .toUtc();

    List<Map<String, dynamic>> data = await db.rawQuery("""
    SELECT * FROM reservation
    WHERE room_id = $roomId
    AND
    is_cancelled = false
    AND
    (
      time_in BETWEEN "${afterDateTime.toIso8601String()}" AND "${beforeDateTime.toIso8601String()}"
      OR
      time_out BETWEEN "${afterDateTime.toIso8601String()}" AND "${beforeDateTime.toIso8601String()}"
    )
    """);

    return data.map((e) {
      e.removeWhere((key, value) => value == null);
      return Reservation.fromJson(e);
    }).toList();
  }
}

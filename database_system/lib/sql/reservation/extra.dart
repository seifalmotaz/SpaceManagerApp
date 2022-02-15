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
        DateTime(now.year, now.month, now.day - 8, now.hour, now.minute)
            .toUtc();
    DateTime beforeDateTime = selectedBeforeDateTime?.toUtc() ??
        DateTime(now.year, now.month, now.day)
            .add(const Duration(days: 360))
            .toUtc();

    int after = (afterDateTime.millisecondsSinceEpoch / 1000).round();
    int before = (beforeDateTime.millisecondsSinceEpoch / 1000).round();

    List<Map<String, dynamic>> data = await db.rawQuery("""
    SELECT * FROM reservation
    WHERE room_id = $roomId
    AND
    is_cancelled = false
    AND
    (
      time_in BETWEEN "${after}" AND "${before}"
      OR
      time_out BETWEEN "${after}" AND "${before}"
    )
    """);
    return data.map((e) {
      Map<String, dynamic> _e = Map.of(e);
      _e.removeWhere((key, value) => value == null);
      GuestReservation? g = GuestReservationTable.schemaToJson(_e);
      if (g != null) return g;
      return CourseReservationTable.schemaToJson(_e);
    }).toList();
  }
}

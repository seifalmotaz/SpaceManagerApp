import 'package:database_system/database_system.dart';

extension CourseReservationExtraQuery on CourseReservationQuery {
  /// find the reservation that will start after now by 1 hour
  Future<List<CourseReservation>> findWillStart() async {
    List<Map<String, dynamic>> data = await db.rawQuery("""
    SELECT reservation.*, 
    ${RoomTable.sqlSelect}, ${GuestTable.sqlSelect}, ${CourseTable.sqlSelect},
    session.id AS session_id
    FROM reservation
    INNER JOIN room ON room.id=reservation.room_id
    INNER JOIN guest ON guest.id=reservation.guest_id
    INNER JOIN course ON course.id=reservation.course_id
    LEFT JOIN session ON session.reservation_id=reservation.id
    WHERE
    ${CourseReservationTable.sqlFindSchema}
    AND
    is_cancelled = false
    AND
    reservation.time_in BETWEEN (strftime('%s', 'now', '-1 hours'))  AND (strftime('%s', 'now', '+2 hours'))
    AND
    session_id IS NULL
    """);
    return data
        .map((e) => CourseReservation.fromJson(e)
          ..room = RoomTable.filterFromJson(e)!
          ..guest = GuestTable.filterFromJson(e)!
          ..course = CourseTable.filterFromJson(e)!)
        .toList();
  }
}

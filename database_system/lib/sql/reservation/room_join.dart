import 'package:database_system/database_system.dart';

class GuestReservation$Room$Guest {
  final GuestReservation reservation;
  final Room room;
  final Guest guest;
  GuestReservation$Room$Guest({
    required this.reservation,
    required this.room,
    required this.guest,
  });
}

extension ReservationJoinRoomQuery on GuestReservationQuery {
  /// find the reservation that will start after now by 1 hour
  Future<List<GuestReservation$Room$Guest>> findWillStart$Room$Guest() async {
    List<Map<String, dynamic>> data = await db.rawQuery("""
    SELECT reservation.*, ${RoomTable.sqlSelect}, ${GuestTable.sqlSelect}, session.id AS session_id
    FROM reservation
    INNER JOIN room ON room.id=reservation.room_id
    INNER JOIN guest ON guest.id=reservation.guest_id
    LEFT JOIN session ON session.reservation_id=reservation.id
    WHERE
    ${GuestReservationTable.sqlFindSchema}
    AND
    is_cancelled = false
    AND
    reservation.time_in BETWEEN (strftime('%s', 'now', '-1 hours'))  AND (strftime('%s', 'now', '+2 hours'))
    AND
    session_id IS NULL
    """);
    return data
        .map((e) => GuestReservation$Room$Guest(
              reservation: GuestReservation.fromJson(e),
              room: RoomTable.filterFromJson(e)!,
              guest: GuestTable.filterFromJson(e)!,
            ))
        .toList();
  }
}

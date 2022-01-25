import 'package:database_system/database_system.dart';

class Guest$Session {
  final Guest guest;
  final int? session;
  Guest$Session({
    required this.guest,
    this.session,
  });
}

extension GuestJoinSessionQuery on GuestQuery {
  Future<List<Guest$Session>> findPhone$Session(String phone) async {
    List<Map<String, dynamic>> data = await db.rawQuery("""
    SELECT guest.*, session.id AS session_id
    FROM guest
    LEFT JOIN (
      SELECT id, time_in, time_out, guest_id FROM session WHERE time_out IS NULL
    ) session ON guest.id=session.guest_id
    WHERE ${GuestTable.phone} LIKE "%$phone%" AND ${GuestTable.nativeIsStaff} = false 
    """);
    return data
        .map((e) => Guest$Session(
              guest: Guest.fromJson(e),
              session: e['session_id'],
            ))
        .toList();
  }

  Future<List<Guest$Session>> findEmail$Session(String email) async {
    List<Map<String, dynamic>> data = await db.rawQuery("""
    SELECT guest.*, session.id AS session_id
    FROM guest
    LEFT JOIN (
      SELECT id, time_in, time_out, guest_id FROM session WHERE time_out IS NULL
    ) session ON guest.id=session.guest_id
    WHERE ${GuestTable.email} LIKE "%$email%" AND ${GuestTable.nativeIsStaff} = false 
    """);

    return data
        .map((e) => Guest$Session(
              guest: Guest.fromJson(e),
              session: e['session_id'],
            ))
        .toList();
  }
}

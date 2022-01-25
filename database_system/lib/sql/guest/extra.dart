import 'package:database_system/database_system.dart';

extension ExtraGuestQuery on GuestQuery {
  Future<List<Guest>> findPhone(String phone) async {
    List<Map<String, dynamic>> data = await db.rawQuery("""
    SELECT *
    FROM guest
    WHERE ${GuestTable.phone} LIKE "%$phone%" AND ${GuestTable.nativeIsStaff} = false 
    """);
    return data.map((e) => Guest.fromJson(e)).toList();
  }

  Future<List<Guest>> findEmail(String email) async {
    List<Map<String, dynamic>> data = await db.rawQuery("""
    SELECT *
    FROM guest
    WHERE ${GuestTable.email} LIKE "%$email%" AND ${GuestTable.nativeIsStaff} = false 
    """);
    return data.map((e) => Guest.fromJson(e)).toList();
  }
}

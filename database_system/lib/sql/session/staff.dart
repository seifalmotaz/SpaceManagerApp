import 'package:database_system/database_system.dart';

extension ExtraStaffQuery on StaffSessionQuery {
  Future<StaffSession?> lastLogin() async {
    List<Map<String, dynamic>> data = await db.rawQuery("""
    SELECT ${StaffSessionTable.sqlSelect}, ${GuestTable.sqlSelect}
    FROM session
    INNER JOIN guest ON ${StaffSessionTable.nativeGuestId} = ${GuestTable.nativeId}
    WHERE ${StaffSessionTable.nativeTimeOut} IS NULL AND ${GuestTable.nativeIsStaff} = true 
    LIMIT 1
    """);
    if (data.isNotEmpty) {
      StaffSession s = (StaffSessionTable.filterFromJson(data.first))!;
      s.guest = GuestTable.filterFromJson(data.first);
      return s;
    }
  }
}

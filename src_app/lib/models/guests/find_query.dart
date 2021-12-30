import 'package:spacemanager/constants/func.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/models/sessions/src.dart';
import 'package:spacemanager/services/database.dart';

extension GuestFindQuery on Guest {
  static Future<List<Guest>> getAllStaff() async {
    List<Map<String, dynamic>> data = await DBService.to.db.query(
      'guests',
      where: 'is_staff = ?',
      whereArgs: [1],
    );
    return data.map((e) => Guest.fromMap(e)).toList();
  }

  static Future<List<Guest>> findByPhone(String phone) async {
    List<Map<String, dynamic>> data = await DBService.to.db.rawQuery("""
    SELECT * FROM guests
    WHERE phone LIKE '%$phone%'
    """);
    return data.map((e) => Guest.fromMap(e)).toList();
  }

  static Future<Guest?> getOneByPhone(String phone) async {
    List<Map<String, dynamic>> data = await DBService.to.db.rawQuery("""
    SELECT * FROM guests
    WHERE phone = '$phone'
    LIMIT 1
    """);
    return data.isNotEmpty ? Guest.fromMap(data.first) : null;
  }

  static Future<List<Guest>> findByEmail(String email) async {
    List<Map<String, dynamic>> data = await DBService.to.db.rawQuery("""
    SELECT * FROM guests
    WHERE email LIKE '%$email%'
    """);
    return data.map((e) => Guest.fromMap(e)).toList();
  }

  static Future<Guest?> getOneByEmail(String email) async {
    List<Map<String, dynamic>> data = await DBService.to.db.rawQuery("""
    SELECT * FROM guests
    WHERE email = '%$email%'
    LIMIT 1
    """);
    return data.isNotEmpty ? Guest.fromMap(data.first) : null;
  }

  /// Find all users with this phone number and
  /// join sesssion.
  /// Session can be null if not exist.
  /// Excluding admin and staff guests.
  static Future<List<GuestWithSession>> findByPhoneJoinSession(
      String phone) async {
    List<Map<String, dynamic>> data = await DBService.to.db.rawQuery("""
    SELECT guests.*, sessions.id AS 'session_id', sessions.start_time AS 'session_start_time' FROM guests
    LEFT JOIN (
      SELECT id, start_time, end_time, guest_id FROM sessions WHERE end_time IS NULL
    ) sessions ON guests.id=sessions.guest_id
    WHERE phone LIKE '%$phone%' AND is_staff = false
    """);
    return data
        .map(
          (e) => GuestWithSession(
            guest: Guest.fromMap(e),
            sessionId: e['session_id'],
            session: Session(
              startTime: fromDateDB(e['session_start_time']),
              id: e['session_id'],
            ),
          ),
        )
        .toList();
  }

  static Future<List<GuestWithSession>> findNotEndedJoinSession() async {
    List<Map<String, dynamic>> data = await DBService.to.db.rawQuery("""
    SELECT guests.*, sessions.id AS 'session_id', sessions.start_time AS 'session_start_time' FROM guests
    LEFT JOIN (
      SELECT id, start_time, end_time, guest_id FROM sessions WHERE end_time IS NULL
    ) sessions ON guests.id=sessions.guest_id
    WHERE is_staff = false AND session_id IS NOT NULL
    """);
    return data
        .map(
          (e) => GuestWithSession(
            guest: Guest.fromMap(e),
            sessionId: e['session_id'],
            session: Session(
              startTime: fromDateDB(e['session_start_time']),
              id: e['session_id'],
            ),
          ),
        )
        .toList();
  }
}

import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/services/database.dart';

extension GuestFindQuery on Guest {
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
  Future<List<Map>> findByPhoneJoinSession(String phone) async {
    List<Map> data = await DBService.to.db.rawQuery("""
    SELECT users.*, sessions.id AS 'session_id', sessions.start_time AS 'session_start_time' FROM users
    LEFT JOIN (
      SELECT id, start_time, end_time FROM sessions WHERE end_time IS NULL
    ) sessions ON users.id=sessions.user_id
    WHERE phone LIKE '%$phone%' AND is_staff = false
    """);
    return data;
  }
}

import 'package:spacemanager/services/database.dart';

class ExcelData {
  static Future<List<Map<String, dynamic>>> getGuestsData({
    DateTime? from,
    DateTime? to,
  }) async {
    List<Map<String, dynamic>> data = await DBService.to.db.rawQuery("""
    SELECT guests.*, COUNT(sessions.id) AS session_count, COUNT(course_sessions.id) AS courses_count
    FROM guests
    LEFT JOIN sessions ON sessions.guest_id = guests.id
    LEFT JOIN course_sessions ON course_sessions.guest_id = guests.id
    WHERE
    length(guests.phone) > 3 AND guests.phone NOT LIKE '#%'
    ${from != null ? 'AND created_date BETWEEN ' + from.toUtc().toIso8601String() + 'AND ' + to!.toUtc().toIso8601String() : ''}
    GROUP BY guests.id
    """);
    return data;
  }
}

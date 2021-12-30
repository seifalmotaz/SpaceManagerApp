import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/services/database.dart';

extension GuestsExcel on Guest {
  static Future<List<Map<String, dynamic>>> getGuestsData() async {
    List<Map<String, dynamic>> data = await DBService.to.db.rawQuery("""
    SELECT guests.*, COUNT(sessions.id) AS session_count, COUNT(course_sessions.id) AS courses_count
    FROM guests
    LEFT JOIN sessions ON sessions.guest_id = guests.id
    LEFT JOIN course_sessions ON course_sessions.guest_id = guests.id
    WHERE length(guests.phone) > 3 AND guests.phone NOT LIKE '#%'
    GROUP BY guests.id
    """);
    return data;
  }
}

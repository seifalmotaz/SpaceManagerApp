import 'package:spacemanager/models/course_sessions/model.dart';
import 'package:spacemanager/services/database.dart';

extension CourseSessionCRUDQuery on CourseSession {
  static Future<List<CourseSession>> list() async {
    List<Map<String, dynamic>> data = await DBService.to.db.query(
      'course_sessions',
      where: 'is_deleted = ?',
      whereArgs: [0],
    );
    return data.map((e) => CourseSession.fromMap(e)).toList();
  }

  static Future<List<CourseSession>> listWithReservation(int resId) async {
    List<Map<String, dynamic>> data = await DBService.to.db.query(
      'course_sessions',
      where: 'course_reservation_id = ?',
      whereArgs: [resId],
    );
    return data.map((e) => CourseSession.fromMap(e)).toList();
  }

  Future<int> create() async {
    var data = await DBService.to.db.insert('course_sessions', toMap());
    return data;
  }

  static Future<CourseSession> read(int id) async {
    List<Map<String, dynamic>> data = await DBService.to.db.query(
      'course_sessions',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    return CourseSession.fromMap(data.first);
  }

  static Future<CourseSession?> readByGuestAndSession(
      int guestId, int sessionId) async {
    List<Map<String, dynamic>> data = await DBService.to.db.query(
      'course_sessions',
      where: 'guest_id = ? AND course_session_id = ?',
      whereArgs: [guestId, sessionId],
      limit: 1,
    );
    return data.isEmpty ? null : CourseSession.fromMap(data.first);
  }

  Future<int> update() async {
    int data = await DBService.to.db.update(
      'course_sessions',
      toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
    return data;
  }

  Future<int?> delete() async {
    int data = await DBService.to.db.delete(
      'course_sessions',
      where: 'id = ?',
      whereArgs: [id],
    );
    return data;
  }
}

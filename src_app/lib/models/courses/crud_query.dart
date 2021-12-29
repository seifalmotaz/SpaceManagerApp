import 'package:spacemanager/models/courses/model.dart';
import 'package:spacemanager/services/database.dart';

import 'joins_classes.dart';

extension CourseCRUDQuery on Course {
  static Future<List<Course>> list() async {
    List<Map<String, dynamic>> data = await DBService.to.db.query(
      'courses',
      where: 'is_deleted = ?',
      whereArgs: [0],
    );
    return data.map((e) => Course.fromMap(e)).toList();
  }

  static Future<List<CourseWithSssion>> listRunning() async {
    DateTime now = DateTime.now();
    DateTime afterDateTime =
        DateTime(now.year, now.month, now.day, now.hour, now.minute).toUtc();
    DateTime beforeDateTime = DateTime(now.year, now.month, now.day)
        .add(const Duration(hours: 24))
        .toUtc();

    List<Map<String, dynamic>> data = await DBService.to.db.rawQuery("""
    SELECT courses.*, sessions.session_id
    FROM courses
    LEFT JOIN (
      SELECT id AS session_id FROM sessions WHERE endTime IS NULL
    ) sessions ON courses.id = sessions.course_id
    WHERE
    sessions.session_id IS NOT NULL
    AND
    (
      start_time BETWEEN "${afterDateTime.toIso8601String()}" AND "${beforeDateTime.toIso8601String()}"
      OR
      end_time BETWEEN "${afterDateTime.toIso8601String()}" AND "${beforeDateTime.toIso8601String()}"
    )
    """);

    return data
        .map((e) => CourseWithSssion(
              sessionId: e['session_id'],
              course: Course.fromMap(e),
            ))
        .toList();
  }

  Future<int> create() async {
    var data = await DBService.to.db.insert('courses', toMap());
    return data;
  }

  static Future<Course> read(int id) async {
    List<Map<String, dynamic>> data = await DBService.to.db.query(
      'courses',
      where: 'id = ?',
      whereArgs: [id],
    );
    return Course.fromMap(data.first);
  }

  Future<int> update() async {
    int data = await DBService.to.db.update(
      'courses',
      toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
    return data;
  }

  Future<int> delete() async {
    int data = await DBService.to.db.update(
      'courses',
      {'is_deleted': 1},
      where: 'id = ?',
      whereArgs: [id],
    );
    return data;
  }
}

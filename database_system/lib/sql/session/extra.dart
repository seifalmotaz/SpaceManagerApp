import 'package:sqflite_common/sqlite_api.dart';

class SessionQuery {
  final Database db;
  SessionQuery(this.db);

  Future<Map<String, dynamic>?> read(int id) async {
    List<Map<String, dynamic>> data = await db.rawQuery("""
    SELECT * FROM session
    WHERE id = $id
    """);
    if (data.isNotEmpty) return data.first;
    return null;
  }
}

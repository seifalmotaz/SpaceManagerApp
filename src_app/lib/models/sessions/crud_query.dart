import 'package:spacemanager/models/sessions/model.dart';
import 'package:spacemanager/services/database.dart';

extension Query on Session {
  static Future<List<Session>> list(int id) async {
    List<Map<String, dynamic>> data = await DBService.to.db.query('sessions');
    return data.map((e) => Session.fromJson(e)).toList();
  }

  /// start session
  /// this create new session
  Future<int> start() async {
    var data = await DBService.to.db.insert('sessions', toJson());
    return data;
  }

  /// update the end_time field
  Future<int> end() async {
    var data = await DBService.to.db.update(
      'sessions',
      {'end_time': DateTime.now().toIso8601String()},
      where: 'id = ?',
      whereArgs: [id],
    );
    return data;
  }

  static Future<Session> read(int id) async {
    List<Map<String, dynamic>> data = await DBService.to.db.query(
      'sessions',
      where: 'id = ?',
      whereArgs: [id],
    );
    return Session.fromJson(data.first);
  }

  Future<int> update() async {
    int data = await DBService.to.db.update(
      'sessions',
      toJson(),
      where: 'id = ?',
      whereArgs: [id],
    );
    return data;
  }

  Future<int> delete() async {
    int data = await DBService.to.db.delete(
      'sessions',
      where: 'id = ?',
      whereArgs: [id],
    );
    return data;
  }
}
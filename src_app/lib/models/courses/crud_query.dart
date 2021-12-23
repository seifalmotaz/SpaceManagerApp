import 'package:spacemanager/models/courses/model.dart';
import 'package:spacemanager/services/database.dart';

extension CRUDQuery on Course {
  static Future<List<Course>> list(int id) async {
    List<Map<String, dynamic>> data = await DBService.to.db.query('courses');
    return data.map((e) => Course.fromJson(e)).toList();
  }

  Future<int> create() async {
    var data = await DBService.to.db.insert('guests', toJson());
    return data;
  }

  static Future<Course> read(int id) async {
    List<Map<String, dynamic>> data = await DBService.to.db.query(
      'courses',
      where: 'id = ?',
      whereArgs: [id],
    );
    return Course.fromJson(data.first);
  }

  Future<int> update() async {
    int data = await DBService.to.db.update(
      'courses',
      toJson(),
      where: 'id = ?',
      whereArgs: [id],
    );
    return data;
  }

  Future<int> delete() async {
    int data = await DBService.to.db.delete(
      'courses',
      where: 'id = ?',
      whereArgs: [id],
    );
    return data;
  }
}

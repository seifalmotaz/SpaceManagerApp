import 'package:spacemanager/models/rooms/model.dart';
import 'package:spacemanager/services/database.dart';

extension CRUDQuery on Room {
  static Future<List<Room>> list(int id) async {
    List<Map<String, dynamic>> data = await DBService.to.db.query('rooms');
    return data.map((e) => Room.fromJson(e)).toList();
  }

  Future<int> create() async {
    var data = await DBService.to.db.insert('rooms', toJson());
    return data;
  }

  static Future<Room> read(int id) async {
    List<Map<String, dynamic>> data = await DBService.to.db.query(
      'rooms',
      where: 'id = ?',
      whereArgs: [id],
    );
    return Room.fromJson(data.first);
  }

  Future<int> update() async {
    int data = await DBService.to.db.update(
      'rooms',
      toJson(),
      where: 'id = ?',
      whereArgs: [id],
    );
    return data;
  }

  Future<int> delete() async {
    int data = await DBService.to.db.delete(
      'rooms',
      where: 'id = ?',
      whereArgs: [id],
    );
    return data;
  }
}

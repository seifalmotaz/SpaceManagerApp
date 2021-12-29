import 'package:spacemanager/models/prices/model.dart';
import 'package:spacemanager/services/database.dart';

extension PriceCRUDQuery on Price {
  static Future<List<Price>> list() async {
    List<Map<String, dynamic>> data = await DBService.to.db.query(
      'prices',
      where: 'is_deleted = ?',
      whereArgs: [0],
    );
    return data.map((e) => Price.fromMap(e)).toList();
  }

  Future<int> create() async {
    var data = await DBService.to.db.insert('prices', toMap());
    return data;
  }

  static Future<Price> read(int id) async {
    List<Map<String, dynamic>> data = await DBService.to.db.query(
      'prices',
      where: 'id = ?',
      whereArgs: [id],
    );
    return Price.fromMap(data.first);
  }

  static Future<Price?> readDefault() async {
    List<Map<String, dynamic>> data = await DBService.to.db.query(
      'prices',
      where: 'is_default = ?',
      whereArgs: [1],
    );
    return data.isEmpty ? null : Price.fromMap(data.first);
  }

  Future<int> update() async {
    int data = await DBService.to.db.update(
      'prices',
      toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
    return data;
  }

  Future<int> delete() async {
    int data = await DBService.to.db.update(
      'prices',
      {'is_deleted': 1},
      where: 'id = ?',
      whereArgs: [id],
    );
    return data;
  }
}

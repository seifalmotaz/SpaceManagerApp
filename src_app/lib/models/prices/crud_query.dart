import 'package:spacemanager/models/prices/model.dart';
import 'package:spacemanager/services/database.dart';

extension CRUDQuery on Price {
  static Future<List<Price>> list(int id) async {
    List<Map<String, dynamic>> data = await DBService.to.db.query('prices');
    return data.map((e) => Price.fromJson(e)).toList();
  }

  Future<int> create() async {
    var data = await DBService.to.db.insert('prices', toJson());
    return data;
  }

  static Future<Price> read(int id) async {
    List<Map<String, dynamic>> data = await DBService.to.db.query(
      'prices',
      where: 'id = ?',
      whereArgs: [id],
    );
    return Price.fromJson(data.first);
  }

  Future<int> update() async {
    int data = await DBService.to.db.update(
      'prices',
      toJson(),
      where: 'id = ?',
      whereArgs: [id],
    );
    return data;
  }

  Future<int> delete() async {
    int data = await DBService.to.db.delete(
      'prices',
      where: 'id = ?',
      whereArgs: [id],
    );
    return data;
  }
}

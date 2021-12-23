import 'package:spacemanager/models/reservations/model.dart';
import 'package:spacemanager/services/database.dart';

extension CRUDQuery on Reservation {
  static Future<List<Reservation>> list(int id) async {
    List<Map<String, dynamic>> data =
        await DBService.to.db.query('reservations');
    return data.map((e) => Reservation.fromJson(e)).toList();
  }

  Future<int> create() async {
    var data = await DBService.to.db.insert('reservations', toJson());
    return data;
  }

  static Future<Reservation> read(int id) async {
    List<Map<String, dynamic>> data = await DBService.to.db.query(
      'reservations',
      where: 'id = ?',
      whereArgs: [id],
    );
    return Reservation.fromJson(data.first);
  }

  Future<int> update() async {
    int data = await DBService.to.db.update(
      'reservations',
      toJson(),
      where: 'id = ?',
      whereArgs: [id],
    );
    return data;
  }

  Future<int> delete() async {
    int data = await DBService.to.db.delete(
      'reservations',
      where: 'id = ?',
      whereArgs: [id],
    );
    return data;
  }
}

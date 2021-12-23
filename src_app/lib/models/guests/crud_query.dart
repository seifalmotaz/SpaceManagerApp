import 'package:crypt/crypt.dart';
import 'package:spacemanager/constants/careers.dart';
import 'package:spacemanager/models/guests/model.dart';
import 'package:spacemanager/services/database.dart';

extension CRUDQuery on Guest {
  static Future<List<Guest>> list(int id) async {
    List<Map<String, dynamic>> data = await DBService.to.db.query('guests');
    return data.map((e) => Guest.fromJson(e)).toList();
  }

  Future<int> create() async {
    Guest g = copyWith(
      career: career ?? UserCareers.student,
      password: password == null ? null : Crypt.sha256(password!).toString(),
    );
    var data = await DBService.to.db.insert('guests', g.toJson());
    return data;
  }

  static Future<Guest> read(int id) async {
    List<Map<String, dynamic>> data = await DBService.to.db.query(
      'guests',
      where: 'id = ?',
      whereArgs: [id],
    );
    return Guest.fromJson(data.first);
  }

  Future<int> update() async {
    int data = await DBService.to.db.update(
      'guests',
      toJson(),
      where: 'id = ?',
      whereArgs: [id],
    );
    return data;
  }

  Future<int> delete() async {
    int data = await DBService.to.db.delete(
      'guests',
      where: 'id = ?',
      whereArgs: [id],
    );
    return data;
  }
}

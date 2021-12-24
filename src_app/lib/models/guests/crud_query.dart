import 'package:crypt/crypt.dart';
import 'package:spacemanager/constants/careers.dart';
import 'package:spacemanager/models/guests/model.dart';
import 'package:spacemanager/services/database.dart';

extension GuestCRUDQuery on Guest {
  static Future<List<Guest>> list() async {
    List<Map<String, dynamic>> data = await DBService.to.db.query('guests');
    return data.map((e) => Guest.fromMap(e)).toList();
  }

  Future<int> create() async {
    Guest g = copyWith(
      career: career ?? GuestCareers.student,
      password: password == null ? null : Crypt.sha256(password!).toString(),
    );
    var data = await DBService.to.db.insert('guests', g.toMap());
    return data;
  }

  static Future<Guest> read(int id) async {
    List<Map<String, dynamic>> data = await DBService.to.db.query(
      'guests',
      where: 'id = ?',
      whereArgs: [id],
    );
    return Guest.fromMap(data.first);
  }

  Future<int> update() async {
    int data = await DBService.to.db.update(
      'guests',
      toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
    return data;
  }

  Future<int> updatePassword() async {
    Guest g = copyWith(
      password: password == null ? null : Crypt.sha256(password!).toString(),
    );
    int data = await DBService.to.db.update(
      'guests',
      g.toMap(),
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

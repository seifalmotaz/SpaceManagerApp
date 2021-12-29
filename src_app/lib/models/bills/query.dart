import 'package:spacemanager/models/bills/model.dart';
import 'package:spacemanager/services/database.dart';

extension BillQuery on Bill {
  static Future<List<Bill>> list() async {
    List<Map<String, dynamic>> data = await DBService.to.db.query('bills');
    return data.map((e) => Bill.fromMap(e)).toList();
  }

  Future<int> create() async {
    var data = await DBService.to.db
        .insert('bills', copyWith(createdDate: DateTime.now()).toMap());
    return data;
  }

  static Future<Bill> read(int id) async {
    List<Map<String, dynamic>> data = await DBService.to.db.query(
      'bills',
      where: 'id = ?',
      whereArgs: [id],
    );
    return Bill.fromMap(data.first);
  }

  static Future<Bill?> lastReservation(int resId) async {
    List<Map<String, dynamic>> data = await DBService.to.db.query(
      'bills',
      where: 'reservation_id = ?',
      whereArgs: [resId],
    );
    return data.isEmpty ? null : Bill.fromMap(data.first);
  }

  Future<int> update() async {
    int data = await DBService.to.db.update(
      'bills',
      toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
    return data;
  }

  Future<int> delete() async {
    int data = await DBService.to.db.delete(
      'bills',
      where: 'id = ?',
      whereArgs: [id],
    );
    return data;
  }

  static Future<List<Bill>> getBillsByDate(
      {required DateTime afterDateTime,
      required DateTime beforeDateTime}) async {
    afterDateTime = afterDateTime.toUtc();
    beforeDateTime = beforeDateTime.toUtc();

    List<Map<String, dynamic>> data = await DBService.to.db.query(
      'bills',
      where: 'created_date BETWEEN ? AND ?',
      orderBy: 'created_date ASC',
      whereArgs: [
        afterDateTime.toIso8601String(),
        beforeDateTime.toIso8601String()
      ],
    );

    return data.map((e) => Bill.fromMap(e)).toList();
  }

  static Future<double> getTotalBillsByDate(
      {required DateTime afterDateTime,
      required DateTime beforeDateTime}) async {
    afterDateTime = afterDateTime.toUtc();
    beforeDateTime = beforeDateTime.toUtc();

    List<Map<String, dynamic>> data = await DBService.to.db.query(
      'bills',
      where: 'created_date BETWEEN ? AND ?',
      whereArgs: [
        afterDateTime.toIso8601String(),
        beforeDateTime.toIso8601String()
      ],
    );

    double total = 0;

    for (Map item in data) {
      total += item['total'];
    }

    return total;
  }
}

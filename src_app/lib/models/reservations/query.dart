import 'package:spacemanager/models/reservations/model.dart';
import 'package:spacemanager/services/database.dart';

extension Query on Reservation {
  /// Get spacific room all reservation
  static Future<List<Reservation>> getByRoom(int i) async {
    List<Map<String, dynamic>> data = await DBService.to.db.query(
      'reservations',
      where: 'room_id = ?',
      whereArgs: [i],
    );
    return data.map((e) => Reservation.fromJson(e)).toList();
  }
}

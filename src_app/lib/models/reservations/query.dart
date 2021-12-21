import 'package:spacemanager/models/database.dart';

extension ReservationsQuery on MyDatabase {
  Future<List<Reservation>> getRooms() => select(reservations).get();
  Future<int> insertRoom(ReservationsCompanion r) =>
      into(reservations).insert(r);
}

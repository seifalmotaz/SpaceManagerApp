import 'package:spacemanager/models/database.dart';

extension RoomsQuery on MyDatabase {
  Future<List<Room>> getRooms() => select(rooms).get();
  Future<int> insertRoom(RoomsCompanion c) => into(rooms).insert(c);
}

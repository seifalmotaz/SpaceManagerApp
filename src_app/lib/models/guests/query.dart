import 'package:spacemanager/models/database.dart';

extension GuestsQuery on MyDatabase {
  Future<List<Guest>> getGuests() => select(guests).get();
  Future<int> insertGuest(GuestsCompanion g) => into(guests).insert(g);
}

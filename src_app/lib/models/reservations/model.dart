import 'package:drift/drift.dart';
import 'package:spacemanager/models/guests/model.dart';
import 'package:spacemanager/models/rooms/model.dart';

class Reservations extends Table {
  IntColumn get id => integer().autoIncrement()();
  // Main data
  DateTimeColumn get from => dateTime()();
  DateTimeColumn get to => dateTime()();
  // Referances
  IntColumn get roomID => integer().references(Rooms, #id)();
  IntColumn get guestID => integer().references(Guests, #id)();
  // Extra
  BoolColumn get isPrePaid => boolean()();
}

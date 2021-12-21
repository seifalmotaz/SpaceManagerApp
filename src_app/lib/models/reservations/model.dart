import 'package:drift/drift.dart';
import 'package:spacemanager/models/guests/model.dart';
import 'package:spacemanager/models/rooms/model.dart';

class Reservations extends Table {
  IntColumn get id => integer().customConstraint('UNIQUE').autoIncrement()();
  // Main data
  DateTimeColumn get from => dateTime()();
  DateTimeColumn get to => dateTime()();
  // Referances
  IntColumn get roomId => integer().references(Rooms, #Id)();
  IntColumn get guestId => integer().references(Guests, #Id)();
  // Extra
  BoolColumn get isPrePaId => boolean()();
}

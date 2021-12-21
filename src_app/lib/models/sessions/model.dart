import 'package:drift/drift.dart';
import 'package:spacemanager/models/courses/model.dart';
import 'package:spacemanager/models/guests/model.dart';
import 'package:spacemanager/models/prices/model.dart';
import 'package:spacemanager/models/reservations/model.dart';
import 'package:spacemanager/models/rooms/model.dart';

class Sessions extends Table {
  IntColumn get id => integer().customConstraint('UNIQUE').autoIncrement()();
  // Main data
  DateTimeColumn get from => dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get to => dateTime()();
  // Extra info
  IntColumn get guestsCount => integer()();
  // Main references
  IntColumn get guestId => integer().references(Guests, #Id)();
  //  Pricing references
  IntColumn get priceId => integer().nullable().references(Prices, #Id)();
  IntColumn get courseId => integer().nullable().references(Courses, #Id)();
  IntColumn get roomId => integer().nullable().references(Rooms, #Id)();
  IntColumn get reservationId =>
      integer().nullable().references(Reservations, #Id)();
}

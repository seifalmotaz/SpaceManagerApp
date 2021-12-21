import 'package:drift/drift.dart';
import 'package:spacemanager/models/courses/model.dart';
import 'package:spacemanager/models/guests/model.dart';
import 'package:spacemanager/models/prices/model.dart';
import 'package:spacemanager/models/reservations/model.dart';
import 'package:spacemanager/models/rooms/model.dart';

class Sessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  // Main data
  DateTimeColumn get from => dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get to => dateTime()();
  // Extra info
  IntColumn get guestsCount => integer()();
  // Main references
  IntColumn get guestID => integer().references(Guests, #id)();
  //  Pricing references
  IntColumn get priceID => integer().nullable().references(Prices, #id)();
  IntColumn get courseID => integer().nullable().references(Courses, #id)();
  IntColumn get roomID => integer().nullable().references(Rooms, #id)();
  IntColumn get reservationID =>
      integer().nullable().references(Reservations, #id)();
}

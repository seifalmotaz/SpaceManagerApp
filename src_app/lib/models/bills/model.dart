import 'package:drift/drift.dart';
import 'package:spacemanager/models/guests/model.dart';
import 'package:spacemanager/models/reservations/model.dart';
import 'package:spacemanager/models/sessions/model.dart';

class Bills extends Table {
  IntColumn get id => integer().autoIncrement()();
  // Main data
  RealColumn get total => real()();
  // Main references
  IntColumn get staffID => integer().references(Guests, #id)();
  //  Pricing references
  IntColumn get sessionID => integer().nullable().references(Sessions, #id)();
  IntColumn get reservationID =>
      integer().nullable().references(Reservations, #id)();
}

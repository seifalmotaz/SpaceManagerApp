import 'package:drift/drift.dart';
import 'package:spacemanager/models/guests/model.dart';
import 'package:spacemanager/models/reservations/model.dart';
import 'package:spacemanager/models/sessions/model.dart';

class Bills extends Table {
  IntColumn get id => integer().customConstraint('UNIQUE').autoIncrement()();
  // Main data
  RealColumn get total => real()();
  // Main references
  IntColumn get staffId => integer().references(Guests, #Id)();
  //  Pricing references
  IntColumn get sessionId => integer().nullable().references(Sessions, #Id)();
  IntColumn get reservationId =>
      integer().nullable().references(Reservations, #Id)();
}

import 'package:drift/drift.dart';

class Guests extends Table {
  IntColumn get id => integer().customConstraint('UNIQUE').autoIncrement()();
  // Main data
  TextColumn get phone =>
      text().customConstraint('UNIQUE').withLength(min: 3, max: 17)();
  // Info data
  TextColumn get name => text().nullable().withLength(min: 3, max: 51)();
  TextColumn get email => text().customConstraint('UNIQUE').nullable()();
  TextColumn get career =>
      text().withDefault(const Constant('GUEST')).withLength(max: 13)();
  TextColumn get gender => text().nullable().withLength(max: 13)();
  // Extra data
  TextColumn get nationalId => text().customConstraint('UNIQUE').nullable()();
  TextColumn get nationalIdPic => text().nullable()();
  // Auth data
  TextColumn get password => text().nullable()();
  BoolColumn get isAdmin => boolean().withDefault(const Constant(false))();
  BoolColumn get isStaff => boolean().withDefault(const Constant(false))();
  // Date time data
  DateTimeColumn get createdDate =>
      dateTime().withDefault(Constant(DateTime.now()))();
}

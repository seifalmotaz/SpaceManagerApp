import 'package:drift/drift.dart';

class Courses extends Table {
  IntColumn get id => integer().customConstraint('UNIQUE').autoIncrement()();
  // Main data
  TextColumn get name => text()();
  RealColumn get ratePerGuest => real()();
  // Date time data
  DateTimeColumn get createdDate =>
      dateTime().withDefault(Constant(DateTime.now()))();
}

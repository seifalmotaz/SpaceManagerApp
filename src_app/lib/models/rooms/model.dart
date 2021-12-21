import 'package:drift/drift.dart';

class Rooms extends Table {
  IntColumn get id => integer().autoIncrement()();
  // Main data
  TextColumn get name => text()();
  IntColumn get capacity => integer()();
  RealColumn get ratePerHour => real()();
}

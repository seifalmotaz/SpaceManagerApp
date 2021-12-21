import 'package:drift/drift.dart';

class Prices extends Table {
  IntColumn get id => integer().autoIncrement()();
  // Main data
  RealColumn get ratePerGuest => real()();
  // Info data
  TextColumn get description =>
      text().withDefault(const Constant('Workspace price rate')).nullable()();
  BoolColumn get isDefault => boolean()();
}

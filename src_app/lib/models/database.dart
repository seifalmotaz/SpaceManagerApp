import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spacemanager/models/bills/model.dart';
import 'package:spacemanager/models/courses/model.dart';
import 'package:spacemanager/models/guests/model.dart';
import 'package:spacemanager/models/prices/model.dart';
import 'package:spacemanager/models/reservations/model.dart';
import 'package:spacemanager/models/rooms/model.dart';
import 'package:spacemanager/models/sessions/model.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'SpaceData', 'database.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(
  tables: [
    Guests,
    Prices,
    Courses,
    Rooms,
    Reservations,
    Sessions,
    Bills,
  ],
)
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;
}

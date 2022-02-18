import 'dart:io';

import 'package:database_system/models/guest/guest.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common/sqlite_api.dart';

class DBService extends GetxService {
  Rx<Database?> dbDatabase = Rx<Database?>(null);

  static DBService get to => Get.find();
  Database get db => dbDatabase.value!;

  connect() async {
    Directory dbFolder = await getApplicationDocumentsDirectory();
    File dir = File(join(dbFolder.path, 'SpaceManager', 'database.sqlite3'));
    DatabaseFactory sFactory = databaseFactoryFfi;
    var connect = await sFactory.openDatabase(
      dir.path,
      options: OpenDatabaseOptions(
        onCreate: createSchema,
        readOnly: false,
        version: 1,
      ),
    );
    dbDatabase.value = connect;
  }

  Future createSchema(Database db, int version) async {
    String sql = await rootBundle
        .loadString('packages/database_system/assets/start/guest.sql');
    await db.execute(sql);
    sql = await rootBundle
        .loadString('packages/database_system/assets/start/course.sql');
    await db.execute(sql);
    sql = await rootBundle
        .loadString('packages/database_system/assets/start/session.sql');
    await db.execute(sql);
    await GuestQuery(db).create(
      email: 'admin@admin.com',
      isAdmin: true,
      isStaff: true,
      name: 'Space Admin',
      phone: 'spaceadmin',
      password: 'spaceadmin',
    );
  }

  @override
  void onClose() {
    dbDatabase.value!.close();
    super.onClose();
  }
}

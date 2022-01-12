import 'dart:io';

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
    var sConnect = await sFactory.openDatabase(
      dir.path,
      options: OpenDatabaseOptions(
        onCreate: createSchema,
        readOnly: false,
        version: 1,
      ),
    );
    dbDatabase.value = sConnect;
  }

  Future createSchema(Database db, int version) async {
    String sql = await rootBundle.loadString('assets/db/start/guest.sql');
    db.execute(sql);
    sql = await rootBundle.loadString('assets/db/start/course.sql');
    db.execute(sql);
    sql = await rootBundle.loadString('assets/db/start/session.sql');
    db.execute(sql);
  }

  @override
  void onClose() {
    dbDatabase.value!.close();
    super.onClose();
  }
}

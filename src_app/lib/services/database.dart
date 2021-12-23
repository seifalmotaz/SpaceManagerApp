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
    File dir = File(join(dbFolder.path, 'SpaceData', 'database.sqlite3'));
    DatabaseFactory sFactory = databaseFactoryFfi;
    var sConnect = await sFactory.openDatabase(dir.path);
    dbDatabase.value = sConnect;
  }

  createSchema() async {
    String sql = await rootBundle.loadString('assets/database/createDB.sql');
    dbDatabase.value!.execute(sql);
  }

  @override
  void onClose() {
    dbDatabase.value!.close();
    super.onClose();
  }
}

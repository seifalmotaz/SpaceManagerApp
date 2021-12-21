import 'dart:io';

import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class StorageService extends GetxService {
  Rx<Database?> storageDatabase = Rx<Database?>(null);

  static StorageService get to => Get.find();
  Database get storage => storageDatabase.value!;
  var store = StoreRef.main();

  connect() async {
    Directory dbFolder = await getApplicationDocumentsDirectory();
    File dir = File(join(dbFolder.path, 'SpaceData', 'storage.db'));
    DatabaseFactory sFactory = databaseFactoryIo;
    var sConnect = await sFactory.openDatabase(dir.path);
    storageDatabase.value = sConnect;
  }

  @override
  void onClose() {
    storage.close();
    super.onClose();
  }

  // vars
  Future<bool> get isFirstRun async =>
      await store.record('isFirstRun').get(storage) as bool? ?? true;
  Future<void> setFirstRun(bool i) async =>
      await store.record('isFirstRun').put(storage, i);

  Future<int> get capacity async =>
      await store.record('capacity').get(storage) as int;
  Future<void> setCapacity(int i) async =>
      await store.record('capacity').put(storage, i);
}

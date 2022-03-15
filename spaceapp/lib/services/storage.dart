import 'dart:io';

import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:spaceapp/widgets/xwidgets.dart';

class StorageService extends GetxService {
  Rx<Database?> storageDatabase = Rx<Database?>(null);

  static StorageService get to => Get.find();
  Database get storage => storageDatabase.value!;
  var store = StoreRef.main();

  connect() async {
    try {
      Directory dbFolder = await getApplicationDocumentsDirectory();
      File dir = File(join(dbFolder.path, 'SpaceManager', 'storage.db'));
      DatabaseFactory sFactory = databaseFactoryIo;
      var sConnect = await sFactory.openDatabase(dir.path);
      storageDatabase.value = sConnect;
    } catch (e, s) {
      MonitoringApp.error(e, s, 'cannot save database');
      return false;
    }

    try {
      List<int> list = List.of(await opensDate);
      list.add(DateTime.now().millisecondsSinceEpoch);
      await setOpensDate(list);
    } catch (e, s) {
      MonitoringApp.error(e, s, 'cannot save todays date when open app');
      return false;
    }

    return true;
  }

  @override
  void onClose() {
    storage.close();
    super.onClose();
  }

  Future<int> get capacity async =>
      await store.record('capacity').get(storage) ?? 0;
  Future<void> setCapacity(int i) async =>
      await store.record('capacity').put(storage, i);

  /// guests who came today and paid per day price
  Future<Map> get guestsToday async =>
      await store.record('guestsToday').get(storage) ?? {};
  Future<void> setGuestsToday(Map i) async =>
      await store.record('guestsToday').put(storage, i);

  /// save the current date when the app open
  /// with local time
  Future<List<int>> get opensDate async =>
      (await store.record('opensDate').get(storage) ?? []).cast<int>();
  Future<void> setOpensDate(List<int> i) async =>
      await store.record('opensDate').put(storage, i);
}

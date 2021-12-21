export 'package:spacemanager/models/guests/query.dart';
export 'package:spacemanager/models/prices/query.dart';
export 'package:spacemanager/models/courses/query.dart';
export 'package:spacemanager/models/rooms/query.dart';
export 'package:spacemanager/models/reservations/query.dart';
export 'package:spacemanager/models/bills/query.dart';
export 'package:spacemanager/models/sessions/query.dart';

import 'package:get/get.dart';
import 'package:spacemanager/models/database.dart';

class DBService extends GetxService {
  // Calling func
  static DBService get to => Get.find();
  // vars
  MyDatabase db = MyDatabase();

  @override
  Future<void> onClose() async {
    await db.close();
    super.onClose();
  }
}

import 'package:get/get.dart';
import 'package:spaceapp/widgets/xwidgets.dart';

import 'storage.dart';

class MemoryGuestsService extends GetxService {
  static MemoryGuestsService get to => Get.find();
  RxList<int> guests = RxList<int>();
  DateTime today = DateTime.now();

  init() async {
    Map data = await StorageService.to.guestsToday;
    DateTime? memoryDate;
    if (data['date'] != null) {
      memoryDate = DateTime.fromMillisecondsSinceEpoch(data['date']);
    }

    if (today.day == memoryDate?.day && today.month == memoryDate?.month) {
      guests.value = List.from(data['guests']);
    } else {
      try {
        await StorageService.to.setGuestsToday({
          'date': today.millisecondsSinceEpoch,
          'guests': [],
        });
      } catch (e, s) {
        MonitoringApp.error(e, s);
      }
    }
  }

  @override
  void onReady() {
    init();
    super.onReady();
  }

  bool readGuest(int id) {
    List<int> _guests = guests.value;
    for (int _id in _guests) {
      if (_id == id) return true;
    }
    return false;
  }

  Future addGuest(int id) async {
    try {
      List<int> _guests = guests.value;
      _guests.add(id);
      await StorageService.to.setGuestsToday({
        'date': today.millisecondsSinceEpoch,
        'guests': _guests,
      });
      guests.value = _guests;
    } catch (e, s) {
      MonitoringApp.error(e, s);
    }
  }
}

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:spacemanager/models/bills/src.dart';
import 'package:spacemanager/models/excel.dart';
import 'package:csv/csv.dart';

List<List> toCSVList(List<Map<String, dynamic>> maps) {
  List<List> list = [];
  List keys = maps.first.keys.toList();
  list.add(keys);
  for (Map item in maps) {
    List l = [];
    for (String i in keys) {
      DateTime? date = DateTime.tryParse(item[i]);
      if (date != null) {
        l.add(Jiffy(date).MMMMEEEEd);
      } else {
        l.add(item[i]);
      }
    }
    list.add(l);
  }
  return list;
}

class HomeAdminController extends GetxController {
  RxList<Bill> bills = <Bill>[].obs;
  RxDouble weekTotal = 0.0.obs;
  RxDouble dayTotal = 0.0.obs;
  RxDouble monthTotal = 0.0.obs;

  exportGuestsData() async {
    List<Map<String, dynamic>> list = await ExcelData.getGuestsData();
    String csv = const ListToCsvConverter().convert(toCSVList(list));
    String? result = await FilePicker.platform.getDirectoryPath();

    if (result != null) {
      var file = File(result + 'guests.csv').openWrite();
      file.write(csv);
      file.close();
    }
  }

  getData() async {
    DateTime now = DateTime.now();
    bills.value = await BillQuery.getBillsByDate(
      afterDateTime: now.subtract(const Duration(days: 90)),
      beforeDateTime: now,
    );
    List<Bill> billsByDay = [];
    DateTime? currentTime;
    double total = 0;
    for (Bill bill in bills) {
      if (currentTime != null && bill.createdDate!.day == currentTime.day) {
        total += bill.total!;
      } else {
        if (currentTime != null) {
          billsByDay.add(Bill(createdDate: currentTime, total: total));
        }
        currentTime = bill.createdDate;
        total = bill.total!;
      }
    }
    if (currentTime != null) {
      billsByDay.add(Bill(createdDate: currentTime, total: total));
    }
    bills.value = billsByDay;
  }

  getWeekData() async {
    DateTime now = DateTime.now();
    double i = await BillQuery.getTotalBillsByDate(
      afterDateTime: now.subtract(const Duration(days: 7)),
      beforeDateTime: now,
    );
    weekTotal.value = i;
  }

  getDayData() async {
    DateTime now = DateTime.now();
    double i = await BillQuery.getTotalBillsByDate(
      afterDateTime: now.subtract(Duration(hours: now.hour)),
      beforeDateTime: now,
    );
    dayTotal.value = i;
  }

  getMonthData() async {
    DateTime now = DateTime.now();
    double i = await BillQuery.getTotalBillsByDate(
      afterDateTime: now.subtract(const Duration(days: 30)),
      beforeDateTime: now,
    );
    monthTotal.value = i;
  }

  @override
  void onReady() {
    getData();
    getWeekData();
    getDayData();
    getMonthData();
    super.onReady();
  }
}

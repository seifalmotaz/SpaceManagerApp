import 'package:get/get.dart';
import 'package:spacemanager/models/bills/src.dart';

class HomeAdminController extends GetxController {
  RxList<Bill> bills = <Bill>[].obs;
  RxDouble weekTotal = 0.0.obs;
  RxDouble dayTotal = 0.0.obs;
  RxDouble monthTotal = 0.0.obs;

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

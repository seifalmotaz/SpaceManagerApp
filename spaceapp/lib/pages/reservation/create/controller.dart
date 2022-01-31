import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/constants/settings.dart';
import 'package:spaceapp/helpers/monitoring.dart';
import 'package:spaceapp/pages/dashboard/controllers/controller.dart';
import 'package:spaceapp/widgets/dialog.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CreateReservationController extends GetxController {
  // calling func
  static CreateReservationController get to => Get.find();
  CreateReservationController(Guest g) {
    guest = Rx<Guest>(g);
  }

  final List<String> freqList = ['Daily', 'Weekly', 'Monthly', 'Monthly 30'];

  late Rx<Guest> guest;
  RxList<Room> rooms = <Room>[].obs;

  Rx<Room?> selectedRoom = Rx<Room?>(null);
  Room? get selectedRoom_ => selectedRoom.value;
  RxList<Appointment> roomAppointments = RxList<Appointment>();

  RxInt reservedHours = 1.obs;
  RxnString frequency = RxnString(null);
  RxInt frequencyNumber = 1.obs;
  CalendarController calendarController = CalendarController();

  RxInt selectedAppointment = 0.obs;
  int get selectedAppointment_ => selectedAppointment.value;
  List<Appointment> get appointmentsList {
    List<Appointment> output = [];
    Map? item = appointmentGroups[selectedAppointment_];
    if (item != null) output.addAll(item['reservations']);
    return output;
  }

  RxMap<int, Map> appointmentGroups = RxMap<int, Map>();

  List<Appointment> freq(Appointment app) {
    switch (frequency.value) {
      case 'Daily':
        return [
          app,
          for (var i = 0; i < frequencyNumber.value; i++)
            Appointment(
              id: app.id,
              color: app.color,
              startTime: app.startTime.add(Duration(days: i + 1)),
              endTime: app.endTime.add(Duration(days: i + 1)),
            )
        ];
      case 'Weekly':
        return [
          app,
          for (var i = 0; i < frequencyNumber.value; i++)
            Appointment(
              id: app.id,
              color: app.color,
              startTime: app.startTime.add(Duration(days: 7 * (i + 1))),
              endTime: app.endTime.add(Duration(days: 7 * (i + 1))),
            )
        ];
      case 'Monthly':
        return [
          app,
          for (var i = 0; i < frequencyNumber.value; i++)
            Appointment(
              id: app.id,
              color: app.color,
              startTime: Jiffy(app.startTime).add(months: (i + 1)).dateTime,
              endTime: Jiffy(app.endTime).add(months: (i + 1)).dateTime,
            )
        ];
      case 'Monthly 30':
        return [
          app,
          for (var i = 0; i < frequencyNumber.value; i++)
            Appointment(
              id: app.id,
              color: app.color,
              startTime: app.startTime.add(Duration(days: 30 * (i + 1))),
              endTime: app.endTime.add(Duration(days: 30 * (i + 1))),
            )
        ];
      default:
        return [app];
    }
  }

  timeSelected(CalendarSelectionDetails calendarSelectionDetails) {
    Map? _selected = appointmentGroups[selectedAppointment_];

    Duration duration = Duration(hours: reservedHours.value);
    DateTime selectedDate = calendarSelectionDetails.date!;
    DateTime endDate = selectedDate.add(duration);
    int listLenght = appointmentGroups.keys.length + 1;
    appointmentGroups[selectedAppointment_] = {
      'title': _selected?['title'] ?? 'Reservation $listLenght',
      'reservations': freq(Appointment(
        color: Colors.blueAccent,
        id: 'the new reservation',
        startTime: selectedDate,
        endTime: endDate,
      ))
    };
  }

  removeFromAppointments(int ai) {
    Map<int, Map> app = appointmentGroups;
    Map<int, Map> newApp = {};
    List<Map> list = app.values.toList();
    list.removeAt(ai);
    newApp = list.asMap();
    selectedAppointment.value = 0;
    appointmentGroups.value = RxMap(newApp);
  }

  getRoomReservations() async {
    if (selectedRoom_ != null) {
      List<dynamic> _reservations =
          await reservationQuery.readRoom(selectedRoom_!.id);

      for (dynamic item in _reservations) {
        if (item is GuestReservation) {
          roomAppointments.add(Appointment(
            color: Colors.teal,
            notes: item.primaryName,
            startTime: item.timeIn,
            endTime: item.timeOut,
          ));
        } else if (item is CourseReservation) {
          roomAppointments.add(Appointment(
            color: Colors.lightBlue,
            notes: item.primaryName,
            startTime: item.timeIn,
            endTime: item.timeOut,
          ));
        }
      }
    }
  }

  setReservationGroupTitle(int i, String? string) {
    if (string != null && string.isNotEmpty) {
      Map map = appointmentGroups.value;
      Map item = map[i];
      item['title'] = string;
      map[i] = item;
    } else {
      Map map = appointmentGroups.value;
      Map item = map[i];
      item['title'] = 'Reservation ${i + 1}';
      map[i] = item;
    }
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    rooms.value = await roomQuery.find(isDeleted: false);
  }

  double getPaidAmount() {
    double total = 0;
    double rate = selectedRoom_!.rate;
    List<Map> list = appointmentGroups.values.toList();
    for (Map item in list) {
      for (Appointment app in item['reservations']) {
        DateTimeRange range =
            DateTimeRange(start: app.startTime, end: app.endTime);

        total += range.duration.inHours * rate;
      }
    }
    return total * reservationPrice;
  }

  double getPaidAmountForAppointment(DateTime start, DateTime end) {
    double rate = selectedRoom_!.rate;
    DateTimeRange range = DateTimeRange(start: start, end: end);
    double total = range.duration.inHours * rate;
    return total * reservationPrice;
  }

  saveAll(Function start, Function stop, ButtonState state) async {
    List<Map> list = appointmentGroups.values.toList();
    for (Map item in list) {
      List<Appointment> apps = item['reservations'];
      for (Appointment app in apps) {
        await MonitoringApp.errorTrack(() async {
          await guestReservationQuery.create(
            timeOut: app.endTime,
            timeIn: app.startTime,
            guestId: guest.value.id,
            roomId: selectedRoom_!.id,
            primaryName: item['title'],
            paidAmount: getPaidAmountForAppointment(app.startTime, app.endTime),
          );
        });
      }
    }
    Get.back();
    Get.back();
    DashboardController.to.toMainPage();
  }

  saveDialog() => Get.dialog(WDialog(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total price:",
                  style: TextStyle(
                    color: colorWhite,
                    fontSize: 27,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${getPaidAmount()}\$",
                  style: const TextStyle(
                    color: colorWhite,
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            ArgonButton(
              height: 45,
              width: 400,
              borderRadius: 13,
              padding: const EdgeInsets.all(11),
              child: const Tooltip(
                message: 'Custom price for the guest',
                child: Text(
                  "Enter",
                  style: TextStyle(
                    color: colorWhite,
                    fontSize: 27,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              loader: Container(
                padding: const EdgeInsets.all(10),
                child: const SpinKitRotatingCircle(
                  color: Colors.white,
                ),
              ),
              onTap: saveAll,
            ),
          ],
        ),
      ));
}

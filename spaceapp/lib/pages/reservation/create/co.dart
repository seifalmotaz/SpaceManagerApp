import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:spaceapp/widgets/xwidgets.dart';
import 'package:spaceapp/constants/settings.dart';

import 'package:spaceapp/pages/dashboard/controllers/controller.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AppointmentGroup {
  String title;
  Color color;
  Map<int, List<Appointment>> subgroups;
  AppointmentGroup({
    required this.title,
    required this.subgroups,
    required this.color,
  });
}

Color colorChooser(int i) {
  List<Color> colors = [
    Colors.redAccent,
    Colors.blueGrey,
    Colors.cyan,
    Colors.green,
    Colors.indigo,
    Colors.orange,
    Colors.deepOrange,
    Colors.lime,
    Colors.yellow,
  ];
  return colors[i];
}

class CreateReservationController extends GetxController {
  // calling func
  static CreateReservationController get to => Get.find();
  CreateReservationController(Guest? g, Course? c) {
    guest = Rxn<Guest>(g);
    course = Rxn<Course>(c);
  }

  final List<String> freqList = ['Daily', 'Weekly', 'Monthly', 'Monthly 30'];

  // main info
  late Rxn<Guest> guest;
  late Rxn<Course> course;
  RxList<Room> rooms = <Room>[].obs; // rooms data

  // room info
  Rx<Room?> selectedRoom = Rx<Room?>(null);
  Room? get selectedRoom_ => selectedRoom.value;
  // room previos reservations
  RxList<Appointment> roomAppointments = RxList<Appointment>();

  // options vars like frequency and reservation hours
  RxInt reservedHours = 1.obs;
  RxnString frequency = RxnString(null);
  RxInt frequencyNumber = 1.obs;
  TextEditingController frequencyNumberEditing = TextEditingController();

  // ui vars
  // $ sign == `selected`
  RxInt $AppointmentGroup = 0.obs;
  int get $AppointmentGroup_ => $AppointmentGroup.value;
  // subgroups
  RxInt $AppointmentSubGroup = 0.obs;
  int get $AppointmentSubGroup_ => $AppointmentSubGroup.value;
  // selected appointements
  RxMap<int, AppointmentGroup> appointmentGroups =
      RxMap<int, AppointmentGroup>();
  //
  List<Appointment> get appointmentsList {
    List<Appointment> output = [...roomAppointments.value];
    for (AppointmentGroup item in appointmentGroups.values.toList()) {
      for (List<Appointment> i in item.subgroups.values.toList()) {
        output.addAll(i);
      }
    }
    return output;
  }

  List<Appointment> get selectedAppointmentList {
    List<Appointment> output = [];
    for (AppointmentGroup item in appointmentGroups.values.toList()) {
      for (List<Appointment> i in item.subgroups.values.toList()) {
        output.addAll(i);
      }
    }
    return output;
  }

  void setReservationGroupTitle(int i, String? string) {
    if (string == null || string.isEmpty) return;
    appointmentGroups[i]!.title = string;
  }

  void timeSelected(CalendarSelectionDetails calendarSelectionDetails) {
    AppointmentGroup? $group = appointmentGroups[$AppointmentGroup_];

    Duration duration = Duration(hours: reservedHours.value);
    DateTime startDate = calendarSelectionDetails.date!;
    DateTime endDate = startDate.add(duration);

    Appointment app = Appointment(
      id: 'value.title',
      startTime: startDate,
      endTime: endDate,
    );

    List<Appointment> _freq = freq(app);
    for (Appointment item in _freq) {
      Appointment? overlap = appointmentsList.firstWhereOrNull((e) =>
          (e.startTime.isAfter(item.startTime) &&
              e.startTime.isBefore(item.endTime)) ||
          (e.endTime.isAfter(item.startTime) &&
              e.endTime.isBefore(item.endTime)));
      if (overlap != null) {
        errorSnack(
          'Overlaping',
          'the appointment is is overlaping with date:\n ${Jiffy(overlap.startTime).yMMMMEEEEdjm}',
        );
        return;
      }
    }

    if ($group != null) {
      Map<int, AppointmentGroup> appGroups = Map.of(appointmentGroups);
      appGroups.update($AppointmentGroup_, (value) {
        app.id = value.title;
        app.color = value.color;
        List<Appointment> $subgroup = freq(app);
        if (value.subgroups.containsKey($AppointmentSubGroup_)) {
          value.subgroups
              .update($AppointmentSubGroup_, (value) => value = $subgroup);
        } else {
          value.subgroups.addAll({$AppointmentSubGroup_: $subgroup});
        }
        return value;
      });
      appointmentGroups.value = appGroups;
    } else {
      Map<int, AppointmentGroup> appGroups = Map.of(appointmentGroups);
      app.id = Jiffy(DateTime.now()).format("yyyy/MM/dd, hh:mm:ss");
      app.color = colorChooser(appointmentGroups.length);
      appGroups[$AppointmentGroup_] = AppointmentGroup(
        title: Jiffy(DateTime.now()).format("yyyy/MM/dd, hh:mm:ss"),
        color: colorChooser(appointmentGroups.length),
        subgroups: {$AppointmentSubGroup_: freq(app)},
      );
      appointmentGroups.value = appGroups;
    }

    frequency.value = null;
    frequencyNumber.value = 1;
    frequencyNumberEditing.text = '';
  }

  getRoomReservations(int id) async {
    List<Appointment> _roomAppointments = [];
    List<dynamic> _reservations = await reservationQuery.readRoom(id);

    for (dynamic item in _reservations) {
      if (item is GuestReservation) {
        _roomAppointments.add(Appointment(
          color: Colors.teal,
          notes: item.tag,
          startTime: item.timeIn,
          endTime: item.timeOut,
        ));
      } else if (item is CourseReservation) {
        _roomAppointments.add(Appointment(
          color: Colors.lightBlue,
          notes: item.tag,
          startTime: item.timeIn,
          endTime: item.timeOut,
        ));
      }
    }
    roomAppointments.value = _roomAppointments;
  }

  /// frequency getter function
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

  @override
  Future<void> onReady() async {
    super.onReady();
    rooms.value = await roomQuery.find(isDeleted: false);
  }

  double getPaidAmount() {
    double total = 0;
    double rate = selectedRoom_!.rate;
    for (Appointment app in selectedAppointmentList) {
      DateTimeRange range =
          DateTimeRange(start: app.startTime, end: app.endTime);
      total += rate * range.duration.inHours;
    }
    return total * reservationPrice;
  }

  double getPaidAmountForAppointment(Appointment app) {
    double rate = selectedRoom_!.rate;
    DateTimeRange range = DateTimeRange(start: app.startTime, end: app.endTime);
    double total = range.duration.inHours * rate;
    return total * reservationPrice;
  }

  save(start, stop, state) async {
    start();
    for (AppointmentGroup group in appointmentGroups.values) {
      List<Appointment> list = [for (List i in group.subgroups.values) ...i];
      for (Appointment app in list) {
        try {
          if (guest.value != null) {
            await guestReservationQuery.create(
              timeOut: app.endTime,
              timeIn: app.startTime,
              guestId: guest.value!.id,
              roomId: selectedRoom_!.id,
              tag: group.title,
              paidAmount: getPaidAmountForAppointment(app),
            );
          } else if (course.value != null) {
            await courseReservationQuery.create(
              timeOut: app.endTime,
              timeIn: app.startTime,
              courseId: course.value!.id,
              roomId: selectedRoom_!.id,
              tag: group.title,
            );
          }
        } catch (e, stackTrace) {
          MonitoringApp.error(e, stackTrace);
        }
      }
    }
    stop();
    Get.back();
    if (guest.value != null) Get.back();
    DashboardController.to.toMainPageUpdate();
  }

  saveDialog() {
    if (selectedRoom_ == null) {
      return errorSnack(
        'Select room',
        'select room and appointments to save',
        const Duration(seconds: 1),
      );
    } else if (selectedAppointmentList.isEmpty) {
      return errorSnack(
        'Select appointments',
        'select appointments to save',
        const Duration(seconds: 1),
      );
    }

    if (course.value != null) {
      save(() {}, () {}, ButtonState.Busy);
      return;
    }

    Get.dialog(WDialog(
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
            onTap: save,
          ),
        ],
      ),
    ));
  }
}

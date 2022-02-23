import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:spaceapp/constants/settings.dart';
import 'package:spaceapp/helpers/snacks.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AppointmentGroup {
  int roomId;
  Color color;
  List<Appointment> appointments;
  AppointmentGroup({
    required this.roomId,
    required this.appointments,
    required this.color,
  });
}

Color colorChooser(int i) {
  List<Color> colors = Colors.primaries;
  if (i >= colors.length) i = i - colors.length;
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
  TextEditingController tagName = TextEditingController();
  CalendarController calendarController = CalendarController();

  // main info
  late Rxn<Guest> guest;
  late Rxn<Course> course;
  RxList<Room> rooms = <Room>[].obs; // rooms data

  // room info
  Rx<int?> selectedRoom = Rx<int?>(null);
  int? get selectedRoom_ => selectedRoom.value;
  // room previos reservations
  RxList<Appointment> roomAppointments = RxList<Appointment>();

  // options vars like frequency and reservation hours
  RxInt reservedHours = 1.obs;
  RxnString frequency = RxnString(null);
  RxInt frequencyNumber = 1.obs;
  TextEditingController frequencyNumberEditing = TextEditingController();

  // ui vars
  // $ sign == `selected`
  RxInt selectedGroup = 0.obs;
  int get selectedGroup_ => selectedGroup.value;
  // selected appointements
  RxMap<int, AppointmentGroup> appointmentGroups =
      RxMap<int, AppointmentGroup>();
  // get all room appointments
  List<Appointment> get appointmentsList {
    List<Appointment> output = [];
    List<AppointmentGroup> groups = appointmentGroups.values
        .where((e) => e.roomId == selectedRoom_!)
        .toList();
    for (AppointmentGroup item in groups) {
      for (Appointment i in item.appointments) {
        output.add(i);
      }
    }

    return [...output, ...roomAppointments.value];
  }

  // get the new appointments only
  List<Appointment> get selectedAppointmentList {
    List<Appointment> output = [];
    for (AppointmentGroup item in appointmentGroups.values) {
      for (Appointment i in item.appointments) {
        output.add(i);
      }
    }
    return output;
  }

  void timeSelected(CalendarSelectionDetails calendarSelectionDetails) {
    Duration duration = Duration(hours: reservedHours.value);
    DateTime startDate = calendarSelectionDetails.date!;
    DateTime endDate = startDate.add(duration);

    Appointment app = Appointment(
      id: selectedRoom_!,
      startTime: startDate,
      endTime: endDate,
      color: colorChooser(selectedGroup_),
    );

    List<Appointment> _freq = freq(app);
    for (Appointment item in _freq) {
      Appointment? overlap = appointmentsList.firstWhereOrNull((e) =>
          (e.startTime.isAfter(item.startTime) &&
              e.startTime.isBefore(item.endTime)) ||
          (e.endTime.isAfter(item.startTime) &&
              e.endTime.isBefore(item.endTime)) ||
          (e.endTime == item.endTime || e.startTime == item.startTime));
      if (overlap != null) {
        errorSnack(
          'Overlaping',
          'the appointment is is overlaping with date:\n ${Jiffy(overlap.startTime).yMMMMEEEEdjm}',
        );
        return;
      }
    }

    frequencyNumber.value = 1;
    frequencyNumberEditing.text = '';

    Map<int, AppointmentGroup> _appointmentGroups =
        Map.of(appointmentGroups.value);

    _appointmentGroups[selectedGroup_] = AppointmentGroup(
      roomId: selectedRoom_!,
      appointments: _freq,
      color: colorChooser(selectedGroup_),
    );

    appointmentGroups.value = _appointmentGroups;
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
    for (AppointmentGroup group in appointmentGroups.values) {
      Room room = rooms.firstWhere((e) => e.id == group.roomId);
      for (Appointment item in group.appointments) {
        DateTimeRange range =
            DateTimeRange(start: item.startTime, end: item.endTime);
        total += room.rate * range.duration.inHours;
      }
    }
    return total * reservationPrice;
  }

  double getCustomPaidAmount(double rate) {
    double total = 0;
    for (AppointmentGroup group in appointmentGroups.values) {
      for (Appointment item in group.appointments) {
        DateTimeRange range =
            DateTimeRange(start: item.startTime, end: item.endTime);
        total += rate * range.duration.inHours;
      }
    }
    return total * reservationPrice;
  }

  double getPaidAmountForAppointment(Appointment app, double rate) {
    DateTimeRange range = DateTimeRange(start: app.startTime, end: app.endTime);
    double total = range.duration.inHours * rate;
    return total;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:spacemanager/constants/error_snack.dart';
import 'package:spacemanager/models/courses/src.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/models/reservations/src.dart';
import 'package:spacemanager/models/rooms/src.dart';
import 'package:spacemanager/models/sessions/src.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class RoomsController extends GetxController {
  RoomsController([GuestWithSession? u, Course? c]) {
    guest.value = u;
    course.value = c;
  }

  RxList<RoomWithReservations> rooms = <RoomWithReservations>[].obs;

  ScrollController contentScrollController = ScrollController();
  ScrollController sideScrollController = ScrollController();

  RxnInt hours = RxnInt();
  RxList<String> frequency = RxList<String>();
  CalendarController calendarController = CalendarController();

  Rx<Room?> room = Rx<Room?>(null);
  Rx<GuestWithSession?> guest = Rx<GuestWithSession?>(null);
  Rx<Course?> course = Rx<Course?>(null);

  RxInt selectedAppointment = 0.obs;
  RxMap<int, List<Appointment>> appointmentsList =
      RxMap<int, List<Appointment>>();
  RxList<Appointment> roomAppointments = RxList<Appointment>();

  Future getRoomsReservations() async {
    List<Room> _rooms = await RoomCRUDQuery.list();
    List<RoomWithReservations> roomsReservations = [];
    for (Room r in _rooms) {
      List<ReservationWithGuest> res =
          await ReservationJoinsQuery.getByDateAndRoom(r.id!);
      ReservationWithSessionWithGuest? runningSession =
          await SessionFindQuery.findNotEndedWithRoom(r.id!);
      roomsReservations.add(RoomWithReservations(
        room: r,
        running: runningSession,
        reservations: res,
      ));
    }
    rooms.value = roomsReservations;
  }

  @override
  void onInit() {
    getRoomsReservations();
    super.onInit();
  }

  removeFromAppointments(int ai) {
    Map<int, List<Appointment>> app = appointmentsList;
    Map<int, List<Appointment>> newApp = {};
    List<List<Appointment>> list = app.values.toList();
    list.removeAt(ai);
    newApp = list.asMap();
    selectedAppointment.value = 0;
    appointmentsList.value = RxMap(newApp);
  }

  void setFreq([String? freq, String? num]) {
    if (freq != null && num != null) {
      frequency.value = [freq, num];
    }

    Appointment a = appointmentsList[selectedAppointment.value]!.first;
    List<Appointment> f = [];

    if (frequency.isEmpty) return;
    if (frequency.length != 2) return;

    for (var i = 0; i < int.parse(frequency.last); i++) {
      late DateTime start;
      late DateTime end;
      if (frequency.first == 'WEEKLY') {
        start = a.startTime.add(Duration(days: ((i + 1) * 7)));
        end = a.endTime.add(Duration(days: ((i + 1) * 7)));
      } else if (frequency.first == 'MONTHLY') {
        start = Jiffy(a.startTime).add(months: (i + 1)).dateTime;
        end = Jiffy(a.endTime).add(months: (i + 1)).dateTime;
      } else if (frequency.first == 'MONTHLY 30') {
        start = a.startTime.add(Duration(days: ((i + 1) * 30)));
        end = a.endTime.add(Duration(days: ((i + 1) * 30)));
      } else if (frequency.first == 'DAY') {
        start = a.startTime.add(Duration(days: (i + 1)));
        end = a.endTime.add(Duration(days: (i + 1)));
      }
      Appointment? overlap;
      for (Appointment item in roomAppointments) {
        if (item.startTime == start || item.endTime == end) {
          overlap = item;
        }
      }
      if (overlap != null) {
        Duration dayRange =
            DateTimeRange(start: a.startTime, end: overlap.startTime).duration;
        errorSnack(
          'Frequency error after ${dayRange.inDays}',
          'The frequency is overlapping on ${Jiffy(overlap.startTime).yMMMMEEEEd}',
        );
        return;
      }
      f.add(
        Appointment(
          startTime: start,
          endTime: end,
          color: Colors.red,
          id: 'the new reservation',
        ),
      );
    }
    // RxList([a, ...f])
    appointmentsList[selectedAppointment.value] = [a, ...f];
  }
}

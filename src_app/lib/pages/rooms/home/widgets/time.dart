import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/models/reservations/src.dart';
import 'package:spacemanager/models/rooms/src.dart';
import 'package:spacemanager/pages/rooms/home/controller.dart';
import 'package:spacemanager/pages/rooms/home/source.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ReservationTimeWidget extends StatefulWidget {
  const ReservationTimeWidget(this.appointments,
      {Key? key, this.ignore = false})
      : super(key: key);
  final List<Appointment> appointments;
  final bool ignore;

  @override
  _ReservationTimeWidgetState createState() => _ReservationTimeWidgetState();
}

class _ReservationTimeWidgetState extends State<ReservationTimeWidget> {
  Room? room;
  List<Appointment> appointments = [];
  List<String>? frequency;

  List<Appointment> getAppointmentList(List<Appointment>? _newAppointments) {
    late List<Appointment> a;
    if (_newAppointments != null) {
      a = _newAppointments + appointments;
    } else {
      a = _newAppointments!;
    }
    return a;
  }

  Future getRoomReservations(Room? r) async {
    RoomsController controller = Get.find<RoomsController>();
    if (controller.room.value != null &&
        (room != null ? controller.room.value!.id != room!.id : true)) {
      setState(() => room = controller.room.value);
      List<ReservationWithGuest> data =
          await ReservationJoinsQuery.getByDateAndRoom(
        controller.room.value!.id!,
        selectedAfterDateTime:
            DateTime.now().subtract(const Duration(days: 10)),
        selectedBeforeDateTime:
            DateTime.now().add(const Duration(days: 30 * 12)),
      );
      List<Appointment> _appointments = data.map((e) {
        String? subject = e.guest.name;
        subject ??= e.guest.phone ?? e.guest.email;
        return Appointment(
          id: e.reservation.id,
          subject: subject ?? '',
          startTime: e.reservation.startTime!,
          endTime: e.reservation.endTime!,
        );
      }).toList();
      controller.roomAppointments.value = appointments;

      setState(() {
        appointments = _appointments;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Get.find<RoomsController>().room.listen(getRoomReservations);
  }

  @override
  Widget build(BuildContext context) {
    RoomsController controller = Get.find<RoomsController>();
    return IgnorePointer(
      ignoring: widget.ignore,
      child: Opacity(
        opacity: widget.ignore ? .51 : 1,
        child: SizedBox(
          width: double.infinity,
          height: Get.height * .51,
          child: SfCalendar(
            controller: controller.calendarController,
            firstDayOfWeek: 6,
            view: CalendarView.week,
            showDatePickerButton: true,
            allowViewNavigation: true,
            cellBorderColor: Colors.transparent,
            cellEndPadding: 0,
            dataSource:
                AppointmentDataSource(getAppointmentList(widget.appointments)),
            selectionDecoration: BoxDecoration(
              border: Border.all(color: BaseColors.lightPrimary, width: 7),
            ),
            timeSlotViewSettings: TimeSlotViewSettings(
              startHour: 0,
              endHour: 24,
              timeIntervalHeight: 51,
              dayFormat: 'EEEE',
              timeTextStyle: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey.shade700,
              ),
            ),
            onSelectionChanged: (calendarSelectionDetails) {
              if (calendarSelectionDetails.date != null) {
                Duration duration = Duration(hours: controller.hours.value!);
                DateTime endTime = calendarSelectionDetails.date!.add(duration);
                Appointment? overlap;
                for (Appointment item in appointments) {
                  if (item.endTime == endTime ||
                      item.startTime == calendarSelectionDetails.date!) {
                    overlap = item;
                  }
                }
                if (overlap == null) {
                  WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
                    controller.appointmentsList[
                        controller.selectedAppointment.value] = [
                      Appointment(
                        color: Colors.red,
                        id: 'the new reservation',
                        startTime: calendarSelectionDetails.date!,
                        endTime: endTime,
                      )
                    ];
                    controller.setFreq();
                  });
                }
              }
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/helpers/snacks.dart';
import 'package:spaceapp/pages/reservation/create/controller.dart';
import 'package:spaceapp/widgets/resposive.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../source.dart';

class CalenderPickerWidget extends StatelessWidget {
  const CalenderPickerWidget({
    Key? key,
    required this.appointments,
  }) : super(key: key);

  final List<Appointment> appointments;

  @override
  Widget build(BuildContext context) {
    CreateReservationController controller = CreateReservationController.to;
    return UIResponsive(
      screen: (Size size) => Container(
        width: double.infinity,
        height: size.height * .71,
        margin: const EdgeInsets.all(27),
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.circular(17),
        ),
        child: SfCalendar(
          firstDayOfWeek: 6,
          view: CalendarView.week,
          showDatePickerButton: true,
          allowViewNavigation: true,
          cellBorderColor: colorWhiteBased,
          cellEndPadding: 0,
          dataSource: AppointmentDataSource(appointments),
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
              if (controller.selectedRoom_ != null) {
                controller.timeSelected(calendarSelectionDetails);
              } else {
                errorSnack(
                  'Unable to select datetime',
                  'Please select room before selecting datetime',
                  const Duration(seconds: 1),
                );
              }
            }
          },
        ),
      ),
    );
  }
}

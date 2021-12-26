import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MiniTimeChipWidget extends StatelessWidget {
  const MiniTimeChipWidget(this.list, {Key? key}) : super(key: key);
  final List<Appointment> list;

  @override
  Widget build(BuildContext context) {
    Appointment appointment = list.first;
    String md = appointment.startTime.month.toString() +
        '/' +
        appointment.startTime.day.toString();

    String from = Jiffy(appointment.startTime).Hm;
    String to = Jiffy(appointment.endTime).Hm;

    return Container(
      padding: const EdgeInsets.all(9),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (list.length == 1)
                Text(
                  md,
                  style: const TextStyle(
                    color: BaseColors.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              Text(
                'From: ' + from,
                style: const TextStyle(
                  color: BaseColors.semiTextColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'To: ' + to,
                style: const TextStyle(
                  color: BaseColors.semiTextColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (list.length > 1)
                Text(
                  list.length.toString() + ' Reservations',
                  style: const TextStyle(
                    color: BaseColors.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
          if (list.length > 1) const SizedBox(height: 11),
          if (list.length > 1)
            Wrap(
              spacing: 5,
              runSpacing: 5,
              children: [
                for (Appointment _appointment in list)
                  Chip(
                    backgroundColor: BaseColors.lightPrimary,
                    label: Text(
                      _appointment.startTime.month.toString() +
                          '/' +
                          _appointment.startTime.day.toString(),
                      style: const TextStyle(
                        color: BaseColors.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            )
        ],
      ),
    );
  }
}

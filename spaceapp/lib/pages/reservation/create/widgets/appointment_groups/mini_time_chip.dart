import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:spaceapp/widgets/xwidgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MiniTimeChipWidget extends StatelessWidget {
  const MiniTimeChipWidget(
    this.list, {
    Key? key,
    required this.onDelete,
    required this.color,
  }) : super(key: key);
  final List<Appointment> list;
  final Function() onDelete;
  final Color color;

  @override
  Widget build(BuildContext context) {
    Appointment appointment = list.first;

    String from = Jiffy(appointment.startTime).jm;
    String to = Jiffy(appointment.endTime).jm;

    return Container(
      padding: const EdgeInsets.only(top: 7),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.circle_outlined, color: color),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (list.length == 1)
                      Text(
                        appointment.startTime.month.toString() +
                            '/' +
                            appointment.startTime.day.toString(),
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
                  ],
                ),
              ),
              IconButton(
                onPressed: onDelete,
                icon: Icon(
                  Icons.delete,
                  size: 21,
                  color: colorBittersweet.withOpacity(.71),
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
                    padding: EdgeInsets.zero,
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

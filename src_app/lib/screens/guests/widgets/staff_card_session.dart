import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/models/sessions/src.dart';
import 'package:spacemanager/screens/guests/mini/label_field.dart';

class StaffCardSessionWidget extends StatefulWidget {
  const StaffCardSessionWidget({
    Key? key,
    required this.guest,
    required this.session,
  }) : super(key: key);

  final Guest guest;
  final Session session;
  @override
  _StaffCardSessionWidgetState createState() => _StaffCardSessionWidgetState();
}

class _StaffCardSessionWidgetState extends State<StaffCardSessionWidget> {
  Duration? time;
  String timeInHour = '';
  String timeInMin = '';

  String tInH() {
    return ((time!.inHours < 10
            ? '0' + time!.inHours.toString()
            : time!.inHours.toString()) +
        ' H');
  }

  String tInM() {
    return (((time!.inMinutes - (time!.inHours * 60)) < 10
            ? '0' + (time!.inMinutes - (time!.inHours * 60)).toString()
            : (time!.inMinutes - (time!.inHours * 60)).toString()) +
        ' M');
  }

  void startTimer() {
    var oneSec = const Duration(seconds: 60);
    Timer.periodic(oneSec, (t) {
      if (mounted) {
        setState(() {
          time = Duration(seconds: time!.inSeconds + oneSec.inSeconds);
          timeInHour = tInH();
          timeInMin = tInM();
        });
      } else {
        t.cancel();
      }
    });
  }

  @override
  void initState() {
    setState(() {
      DateTimeRange t = DateTimeRange(
        start: widget.session.startTime!,
        end: DateTime.now(),
      );
      time = t.duration;
      startTimer();
      timeInMin = tInM();
      timeInHour = tInH();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 27),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '@' + (widget.guest.name ?? 'Unknown'),
                style: TextStyle(
                  color: Colors.blueGrey.shade900,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 17, vertical: 11),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelField(
                      widget.guest.email ?? 'No email',
                      Icons.email_outlined,
                    ),
                    const SizedBox(height: 5),
                    labelField(
                      widget.guest.phone ?? 'No phone',
                      Icons.phone_outlined,
                    ),
                    const SizedBox(height: 5),
                    labelField(
                      widget.guest.gender ?? 'Undefined',
                      widget.guest.gender == null
                          ? FontAwesomeIcons.genderless
                          : widget.guest.gender == 'Male'
                              ? FontAwesomeIcons.mars
                              : FontAwesomeIcons.venus,
                    ),
                    const SizedBox(height: 5),
                    labelField(
                      widget.guest.career ?? 'Not specified',
                      FontAwesomeIcons.user,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          SizedBox(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Working duration',
                  style: TextStyle(
                    color: Colors.blueGrey.shade800,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Wrap(
                  runSpacing: 13,
                  spacing: 13,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  alignment: WrapAlignment.end,
                  children: [
                    Chip(
                      backgroundColor: BaseColors.primary,
                      label: Text(
                        timeInHour,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Chip(
                      backgroundColor: BaseColors.primary,
                      label: Text(
                        timeInMin,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

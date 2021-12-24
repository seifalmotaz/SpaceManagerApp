import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/models/sessions/src.dart';
import 'package:spacemanager/screens/guests/mini/label_field.dart';

class GuestSessionCardWidget extends StatefulWidget {
  const GuestSessionCardWidget({
    Key? key,
    required this.guestWithSession,
  }) : super(key: key);

  final GuestWithSession guestWithSession;

  @override
  _GuestSessionCardWidgetState createState() => _GuestSessionCardWidgetState();
}

class _GuestSessionCardWidgetState extends State<GuestSessionCardWidget> {
  late Guest guest;
  late Session? session;
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
      guest = widget.guestWithSession.guest;
      session = widget.guestWithSession.session;
      if (widget.guestWithSession.sessionId != null) {
        DateTimeRange t = DateTimeRange(
          start: session!.startTime!,
          end: DateTime.now(),
        );
        time = t.duration;
        startTimer();
        timeInMin = tInM();
        timeInHour = tInH();
      }
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
                '@' + (guest.name ?? 'Unknown'),
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
                      guest.email ?? 'No email',
                      Icons.email_outlined,
                    ),
                    const SizedBox(height: 5),
                    labelField(
                      guest.phone ?? 'No phone',
                      Icons.phone_outlined,
                    ),
                    const SizedBox(height: 5),
                    labelField(
                      guest.gender ?? 'Undefined',
                      guest.gender == null
                          ? FontAwesomeIcons.genderless
                          : guest.gender == 'Male'
                              ? FontAwesomeIcons.mars
                              : FontAwesomeIcons.venus,
                    ),
                    const SizedBox(height: 5),
                    labelField(
                      guest.career ?? 'Not specified',
                      FontAwesomeIcons.user,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          if (widget.guestWithSession.sessionId != null)
            SizedBox(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Session duration',
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
                        backgroundColor: BaseColors.lightPrimary,
                        label: Text(
                          timeInHour,
                          style: TextStyle(
                            color: Colors.blueGrey.shade900.withOpacity(.81),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Chip(
                        backgroundColor: BaseColors.lightPrimary,
                        label: Text(
                          timeInMin,
                          style: TextStyle(
                            color: Colors.blueGrey.shade900.withOpacity(.81),
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

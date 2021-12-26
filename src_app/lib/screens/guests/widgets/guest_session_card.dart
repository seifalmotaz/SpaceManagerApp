import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/models/sessions/src.dart';
import 'package:spacemanager/pages/home/controller.dart';
import 'package:spacemanager/pages/rooms/rooms.dart';
import 'package:spacemanager/screens/guests/mini/label_field.dart';
import 'package:spacemanager/screens/sessions/end_session/end_session.dart';
import 'package:spacemanager/screens/sessions/start_session/start_session.dart';

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

  TextStyle btnTextStyle = const TextStyle(
    fontWeight: FontWeight.w700,
    color: Colors.white,
    fontSize: 13,
  );

  BoxDecoration btnDecoration = BoxDecoration(
    color: BaseColors.primary,
    borderRadius: BorderRadius.circular(13),
  );

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
          end: DateTime.now().toUtc(),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      margin: const EdgeInsets.only(top: 27),
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
            ),
          const SizedBox(height: 13),
          Row(
            children: [
              if (widget.guestWithSession.sessionId == null)
                Flexible(
                  flex: 2,
                  child: InkWell(
                    onTap: () async {
                      GuestWithSession gs = widget.guestWithSession;
                      Guest guest = await gs.guest.checkGuestByPhone();
                      await Get.bottomSheet(StartSessionScreen(guest));
                      HomeController.to.restart();
                    },
                    child: Container(
                      height: 27,
                      width: double.infinity,
                      decoration: btnDecoration,
                      child: Center(
                        child: Text(
                          'Start session',
                          style: btnTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
              if (widget.guestWithSession.sessionId != null)
                Flexible(
                  flex: 2,
                  child: InkWell(
                    onTap: () async {
                      await Get.bottomSheet(
                          EndSessionScreen(widget.guestWithSession));
                      HomeController.to.restart();
                    },
                    child: Container(
                      height: 27,
                      width: double.infinity,
                      decoration:
                          btnDecoration.copyWith(color: Colors.transparent),
                      child: Center(
                        child: Text(
                          'End session',
                          style: btnTextStyle.copyWith(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              const SizedBox(width: 3),
              Flexible(
                flex: 2,
                child: InkWell(
                  onTap: () async {
                    GuestWithSession gs = widget.guestWithSession;
                    gs.guest = await gs.guest.checkGuestByPhone();
                    await Get.to(() => RoomsPage(gs));
                    HomeController.to.restart();
                  },
                  child: Container(
                    height: 27,
                    width: double.infinity,
                    decoration: btnDecoration,
                    child: Center(
                      child: Text(
                        'Rooms',
                        style: btnTextStyle,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 3),
              if (widget.guestWithSession.sessionId == null)
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 27,
                    width: double.infinity,
                    decoration: btnDecoration,
                    child: Center(
                      child: Text(
                        'Start course',
                        style: btnTextStyle,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

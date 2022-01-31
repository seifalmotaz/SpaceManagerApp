import 'dart:async';

import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/pages/dashboard/controllers/controller.dart';
import 'package:timeago/timeago.dart' as timeago;

class SessionItemWidget extends StatefulWidget {
  const SessionItemWidget(this.session, {Key? key}) : super(key: key);

  final CourseSession session;

  @override
  State<SessionItemWidget> createState() => _SessionItemWidgetState();
}

class _SessionItemWidgetState extends State<SessionItemWidget> {
  late CourseSession session;
  late Guest guest;
  late Room room;
  late Course course;

  @override
  void initState() {
    session = widget.session;
    guest = session.guest!;
    course = session.course!;
    room = DashboardController.to.rooms
        .firstWhere((e) => (e.id == session.roomId));
    Timer.periodic(const Duration(seconds: 60), (timer) {
      if (mounted) setState(() {});
      if (!mounted) timer.cancel();
    });
    super.initState();
  }

  DateTime get timeIn => session.timeIn;
  String get timeAgo => timeago.format(timeIn);
  String get getTitle => course.name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 13),
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Room: ',
                    style: TextStyle(color: colorSemiText),
                  ),
                  Text(
                    room.name,
                    style: const TextStyle(
                      color: colorSemiText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(
                getTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorText,
                  fontSize: 27,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'From: ',
                    style: TextStyle(color: colorSemiText),
                  ),
                  Text(
                    Jiffy(timeIn).jm,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: colorText,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              Text(
                timeAgo,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: colorText,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          Column(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'End',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: colorText,
                    fontSize: 16,
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

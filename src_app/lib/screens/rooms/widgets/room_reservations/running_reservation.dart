import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:jiffy/jiffy.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/models/reservations/src.dart';
import 'package:spacemanager/models/sessions/getters.dart';
import 'package:spacemanager/models/sessions/joins_classes.dart';
import 'package:spacemanager/models/sessions/ref.dart';
import 'package:spacemanager/screens/sessions/end_course_sesstion/end_course_sesstion.dart';
import 'package:spacemanager/screens/sessions/end_session/end_session.dart';

class RunningReservationTile extends StatefulWidget {
  const RunningReservationTile(this.session, this.onUpdate, {Key? key})
      : super(key: key);
  final ReservationWithSessionWithGuest session;
  final Function? onUpdate;

  @override
  State<RunningReservationTile> createState() => _RunningReservationTileState();
}

class _RunningReservationTileState extends State<RunningReservationTile> {
  late ReservationWithSessionWithGuest session;
  String startTime = '';

  @override
  void initState() {
    session = widget.session;
    super.initState();
    setState(() {
      startTime = Jiffy(session.session!.session.startTime!).jm;
    });
  }

  endSession() async {
    ReservationWithSessionWithGuest s = widget.session;
    bool? wait;
    if (s.session!.session.courseId != null) {
      wait = await Get.bottomSheet(
        EndCourseSessionScreen(
          SessionWithCourse(
            course: await s.session!.session.course,
            session: s.session!.session,
            courseId: s.session!.session.courseId!,
          ),
        ),
      );
    } else {
      wait = await Get.bottomSheet(
        EndSessionScreen(
          GuestWithSession(
            guest: await s.session!.session.guest(),
            session: s.session!.session,
            sessionId: s.session!.session.id,
          ),
        ),
      );
    }
    if (wait != null && wait) {
      if (widget.onUpdate != null) {
        widget.onUpdate!();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: endSession,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text(
                  'From:  ',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  startTime,
                  style: TextStyle(
                    color: Colors.blueGrey.shade800,
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            GFButton(
              text: 'End it',
              color: BaseColors.primary,
              onPressed: endSession,
            ),
          ],
        ),
      ),
    );
  }
}

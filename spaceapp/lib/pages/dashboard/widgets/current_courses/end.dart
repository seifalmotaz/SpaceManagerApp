import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:xwidgets/xwidgets.dart';
import 'package:spaceapp/helpers/monitoring.dart';
import 'package:spaceapp/pages/dashboard/controllers/controller.dart';
import 'package:spaceapp/pages/dashboard/screens/widgets/widgets.dart';

class EndCourseSessions extends StatefulWidget {
  const EndCourseSessions({
    Key? key,
    required this.course,
    required this.room,
    required this.session,
  }) : super(key: key);

  final CourseSession session;
  final Room room;
  final Course course;

  @override
  State<EndCourseSessions> createState() => _EndCourseSessionsState();
}

class _EndCourseSessionsState extends State<EndCourseSessions> {
  final DateTime datetime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'End course:',
              style: TextStyle(
                color: colorWhite,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              Jiffy(datetime).jm,
              style: const TextStyle(
                fontSize: 21,
                color: colorWhite,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        dataLabel(
          i: 1,
          title: 'Course name',
          trailing: widget.course.name,
        ),
        dataLabel(
          i: 3,
          title: 'Room',
          trailing: widget.room.name,
        ),
        dataLabel(
          i: 4,
          title: 'From: ' + Jiffy(widget.session.timeIn).jm,
          trailing: 'To: ' + Jiffy(datetime).jm,
        ),
        Center(
          child: ArgonButton(
            height: 35,
            width: 300,
            borderRadius: 13,
            child: const Text(
              'End course',
              style: TextStyle(
                color: colorWhite,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            loader: Container(
              padding: const EdgeInsets.all(10),
              child: const SpinKitRotatingCircle(
                color: Colors.white,
              ),
            ),
            onTap: (startLoading, stopLoading, btnState) async {
              startLoading();
              await MonitoringApp.errorTrack(() async {
                await courseSessionQuery.update(
                  id: widget.session.id,
                  timeOut: datetime,
                );
              });
              stopLoading();
              Get.back();
              DashboardController.to.toMainPageUpdate();
            },
          ),
        ),
      ],
    );
  }
}

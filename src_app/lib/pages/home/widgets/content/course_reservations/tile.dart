import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/constants/error_snack.dart';
import 'package:spacemanager/models/course_sessions/model.dart';
import 'package:spacemanager/models/reservations/joins_classes.dart';
import 'package:spacemanager/models/sessions/src.dart';
import 'package:spacemanager/pages/home/controllers/controller.dart';

class CourseReservationsTile extends StatefulWidget {
  const CourseReservationsTile({
    Key? key,
    required this.rc,
  }) : super(key: key);

  final ReservationWithCourse rc;

  @override
  State<CourseReservationsTile> createState() => _CourseReservationsTileState();
}

class _CourseReservationsTileState extends State<CourseReservationsTile> {
  late ReservationWithCourse rc;
  late Jiffy jiffyStart;
  late Jiffy jiffyEnd;

  List<CourseSession> sessionReservation = [];
  bool isCourseSession = false;

  @override
  void initState() {
    rc = widget.rc;
    jiffyStart = Jiffy(rc.reservation.startTime);
    jiffyEnd = Jiffy(rc.reservation.endTime);
    super.initState();
    getData();
    HomeController.to.courseGuest.listen(listenGuest);
  }

  listenGuest(g) {
    if (g != null) {
      CourseSession? c = sessionReservation
          .firstWhereOrNull((element) => element.guestId == g.id!);
      if (mounted) {
        setState(() {
          if (c != null) {
            isCourseSession = true;
          } else {
            isCourseSession = false;
          }
        });
      }
    }
  }

  getData() async {
    List<CourseSession> list =
        await CourseSessionCRUDQuery.listWithReservation(rc.reservation.id!);

    setState(() {
      sessionReservation = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Name:',
                style: TextStyle(
                  color: BaseColors.semiTextColor,
                ),
              ),
              Obx(
                () => Row(
                  children: [
                    if (HomeController.to.courseGuest.value != null)
                      TextButton(
                        child: Text(
                          isCourseSession
                              ? 'Remove reservation'
                              : 'Add reservation',
                          style: TextStyle(
                            color: isCourseSession
                                ? BaseColors.primary
                                : BaseColors.semiTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () async {
                          if (isCourseSession) {
                            CourseSession c = sessionReservation.firstWhere(
                                (element) =>
                                    element.guestId ==
                                    HomeController.to.courseGuest.value!.id!);
                            try {
                              await c.delete();
                              getData();
                              HomeController.to.courseGuest.value = null;
                              Get.back();
                            } catch (e) {
                              errorSnack('Code error', e.toString());
                            }
                          } else {
                            CourseSession cs = CourseSession(
                              courseId: rc.course.id!,
                              courseReservationId: rc.reservation.id!,
                              guestId: HomeController.to.courseGuest.value!.id!,
                            );
                            try {
                              await cs.create();
                              getData();
                              HomeController.to.courseGuest.value = null;
                              Get.back();
                            } catch (e) {
                              errorSnack('Code error', e.toString());
                            }
                          }
                        },
                      ),
                    if (HomeController.to.courseGuest.value == null)
                      TextButton(
                        child: const Text(
                          'Start',
                          style: TextStyle(
                            color: BaseColors.semiTextColor,
                          ),
                        ),
                        onPressed: () async {
                          Session session = Session(
                            courseId: rc.course.id!,
                            roomId: rc.roomId,
                            reservationId: rc.reservation.id!,
                            guestsCount: sessionReservation.length,
                          );
                          int data = await session.start();
                          for (CourseSession item in sessionReservation) {
                            item.courseSessionId = data;
                            await item.update();
                          }
                          HomeController.to.restart();
                        },
                      ),
                  ],
                ),
              )
            ],
          ),
          Text(
            widget.rc.course.name!,
            style: const TextStyle(
              color: BaseColors.textColor,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 3),
          Row(
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
                    jiffyStart.jm,
                    style: const TextStyle(
                      // fontSize: 23,
                      color: BaseColors.semiTextColor,
                    ),
                  ),
                  const Text(
                    '  To:  ',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    jiffyEnd.jm,
                    style: const TextStyle(
                      // fontSize: 23,
                      color: BaseColors.semiTextColor,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Room: ${widget.rc.roomName},  ',
                    style: const TextStyle(
                      color: BaseColors.semiTextColor,
                    ),
                  ),
                  Text(
                    "${sessionReservation.length}/${rc.course.capacity}",
                    style: const TextStyle(
                      // fontSize: 23,
                      color: BaseColors.semiTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/constants/error_snack.dart';
import 'package:spacemanager/models/bills/src.dart';
import 'package:spacemanager/models/course_sessions/model.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/models/sessions/getters.dart';
import 'package:spacemanager/models/sessions/joins_classes.dart';
import 'package:spacemanager/pages/home/controllers/controller.dart';
import 'package:spacemanager/services/auth.dart';

class CoursePricingTile extends StatefulWidget {
  const CoursePricingTile({
    Key? key,
    required this.sc,
  }) : super(key: key);

  final SessionWithCourse sc;

  @override
  State<CoursePricingTile> createState() => _CoursePricingTileState();
}

class _CoursePricingTileState extends State<CoursePricingTile> {
  int total = 0;
  late SessionWithCourse sc;

  @override
  void initState() {
    sc = widget.sc;
    super.initState();
    getData();
  }

  getData() async {
    int? t = await sc.session.getTotal();
    setState(() {
      total = t ?? 0;
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sc.course.name!,
                style: const TextStyle(
                  color: BaseColors.textColor,
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                total.toString() + '\$',
                style: const TextStyle(
                  color: BaseColors.semiTextColor,
                  fontSize: 23,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${sc.billsCount}/${sc.session.guestsCount}',
                style: const TextStyle(color: BaseColors.semiTextColor),
              ),
              TextButton(
                child: const Text(
                  'Bill',
                  style: TextStyle(color: BaseColors.semiTextColor),
                ),
                onPressed: () {
                  Guest? guest = HomeController.to.courseGuest.value;
                  if (sc.billsCount! < sc.session.guestsCount! &&
                      guest != null) {
                    Get.snackbar(
                      'Add it',
                      'Are you sure.',
                      isDismissible: false,
                      colorText: Colors.black,
                      maxWidth: Get.width * .3,
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.white,
                      margin: const EdgeInsets.symmetric(vertical: 51),
                      mainButton: TextButton(
                        onPressed: () async {
                          CourseSession? cs = await CourseSessionCRUDQuery
                              .readByGuestAndSession(guest.id!, sc.session.id!);
                          if (cs != null) {
                            Bill bill = Bill(
                              reservationId: sc.session.reservationId,
                              sessionId: sc.session.id,
                              staffId: AuthService.to.guest!.id,
                              total: total.toDouble(),
                              courseSessionId: cs.id,
                            );
                            await bill.create();
                            setState(() {
                              sc.billsCount = sc.billsCount! + 1;
                            });
                            Get.back();
                            HomeController.to.courseGuest.value = null;
                            successSnack(
                                'Added', 'We have add a bill successfully');
                          } else {
                            errorSnack('Not found',
                                'The guest has not been enter the course');
                          }
                        },
                        child: const Text(
                          'Bill',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

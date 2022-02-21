import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xwidgets/xwidgets.dart';
import 'package:spaceapp/pages/course/read/controller.dart';

class GroupsListWidget extends StatelessWidget {
  const GroupsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReadCourseController controller = Get.find<ReadCourseController>();
    return Obx(() => Wrap(
          spacing: 11,
          runSpacing: 11,
          children: [
            for (ReservationsGroup group in controller.groups_)
              SizedBox(
                width: 250,
                child: Material(
                  color: colorWhite,
                  borderRadius: BorderRadius.circular(13),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(13),
                    onTap: () {
                      controller.selectedGroup.value = group;
                      List<CourseReservation> data = controller.reservations_
                          .where((e) => e.tag == group.title)
                          .toList();

                      data.sort((a, b) {
                        return a.timeIn.compareTo(b.timeIn);
                      });

                      controller.selectedReservations.value = data;
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              group.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Material(
                            color: colorDarkLightest,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                group.count.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ));
  }
}

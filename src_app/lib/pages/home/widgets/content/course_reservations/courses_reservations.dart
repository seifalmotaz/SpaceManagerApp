import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/models/reservations/joins_classes.dart';
import 'package:spacemanager/pages/home/controllers/controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'tile.dart';

class CoursesReservationsWidget extends StatefulWidget {
  const CoursesReservationsWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CoursesReservationsWidget> createState() =>
      _CoursesReservationsWidgetState();
}

class _CoursesReservationsWidgetState extends State<CoursesReservationsWidget> {
  ScrollController scroll = ScrollController();
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return Scrollbar(
      isAlwaysShown: true,
      controller: scroll,
      child: Obx(
        () => StaggeredGridView.countBuilder(
          controller: scroll,
          itemCount: controller.courses.length,
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          mainAxisSpacing: 13,
          crossAxisSpacing: 13,
          staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 23),
          itemBuilder: (context, index) {
            ReservationWithCourse rc = controller.courses[index];
            return CourseReservationsTile(rc: rc);
          },
        ),
      ),
    );
  }
}

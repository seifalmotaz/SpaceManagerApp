import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/models/sessions/joins_classes.dart';
import 'package:spacemanager/pages/home/controllers/controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'course_tile.dart';

class CoursesPricingWidget extends StatefulWidget {
  const CoursesPricingWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CoursesPricingWidget> createState() => _CoursesPricingWidgetState();
}

class _CoursesPricingWidgetState extends State<CoursesPricingWidget> {
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
          itemCount: controller.coursesPricing.length,
          crossAxisCount: 2,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          mainAxisSpacing: 13,
          crossAxisSpacing: 13,
          staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 23),
          itemBuilder: (context, index) {
            SessionWithCourse sc = controller.coursesPricing[index];
            return CoursePricingTile(sc: sc);
          },
        ),
      ),
    );
  }
}

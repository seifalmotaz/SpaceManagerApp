import 'package:flutter/material.dart';

import 'course_reservations/courses_reservations.dart';
import 'courses_pricing/courses_pricing.dart';

class CoursesSection extends StatelessWidget {
  const CoursesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: const [],
        ),
        const CoursesPricingWidget(),
        const Expanded(child: CoursesReservationsWidget()),
      ],
    );
  }
}

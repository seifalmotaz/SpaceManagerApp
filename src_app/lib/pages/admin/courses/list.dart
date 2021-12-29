import 'package:flutter/material.dart';
import 'package:spacemanager/models/courses/src.dart';

import 'course_tile.dart';

class CoursesList extends StatefulWidget {
  const CoursesList({
    Key? key,
    required this.courses,
    this.onDelete,
  }) : super(key: key);

  final List<Course> courses;
  final Function? onDelete;

  @override
  State<CoursesList> createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: controller,
      isAlwaysShown: true,
      child: SingleChildScrollView(
        controller: controller,
        padding: const EdgeInsets.all(51),
        child: Wrap(
          spacing: 21,
          runSpacing: 21,
          children: [
            for (Course course in widget.courses)
              CourseTileWidget(course: course, onDelete: widget.onDelete),
          ],
        ),
      ),
    );
  }
}

import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:spaceapp/widgets/xwidgets.dart';

class CourseDataWidget extends StatelessWidget {
  const CourseDataWidget({
    Key? key,
    required this.course,
  }) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(21),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Course name:',
            style: TextStyle(color: colorSemiText),
          ),
          Text(
            course.name,
            style: const TextStyle(
              color: colorDarkLight,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              const Text(
                'Description: ',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                course.description,
                style: const TextStyle(color: colorSemiText),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              const Text(
                'Total Price:   ',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                '${course.totalPrice.round()}\$',
                style: const TextStyle(
                  color: colorSemiText,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'Created date:   ',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                Jiffy(course.createdDate).yMMMEdjm,
                style: const TextStyle(
                  color: colorSemiText,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

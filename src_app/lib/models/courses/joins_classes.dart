import 'package:spacemanager/models/courses/model.dart';

class CourseWithSssion {
  int? sessionId;
  Course course;
  CourseWithSssion({
    required this.course,
    this.sessionId,
  });
}

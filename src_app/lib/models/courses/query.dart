import 'package:spacemanager/models/database.dart';

extension CoursesQuery on MyDatabase {
  Future<List<Course>> getCourses() => select(courses).get();
  Future<int> insertCourse(CoursesCompanion p) => into(courses).insert(p);
}

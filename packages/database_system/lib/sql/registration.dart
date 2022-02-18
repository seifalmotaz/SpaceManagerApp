import 'package:database_system/database_system.dart';

extension RegistrationExtraQuery on CourseRegistrationQuery {
  Future<List<CourseRegistration>> findForCourse(int courseId) async {
    List<QueryData> data = await db.rawQuery("""
    SELECT course_registration.*, ${GuestTable.sqlSelect} FROM course_registration
    INNER JOIN guest ON guest.id = course_registration.guest_id
    WHERE course_id = ?
    """, [courseId]);

    return data
        .map<CourseRegistration>((e) => CourseRegistration.fromJson(e)
          ..guest = GuestTable.filterFromJson(e))
        .toList();
  }
}

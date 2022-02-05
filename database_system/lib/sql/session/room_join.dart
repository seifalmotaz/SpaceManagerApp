import 'package:database_system/database_system.dart';

class Session$Course<T> {
  final T session;
  final Guest guest;
  final Course? course;

  Session$Course({
    required this.session,
    required this.guest,
    this.course,
  });
}

extension RoomJoinRoomSessionQuery on RoomSessionQuery {
  Future<List<RoomSession>> getCurrent() async {
    List<Map<String, dynamic>> data = await db.rawQuery("""
    SELECT session.*, ${GuestTable.sqlSelect}
    FROM session
    INNER JOIN guest ON guest.id = session.guest_id
    WHERE
    ${RoomSessionTable.sqlFindSchema}
    AND
    session.room_id IS NOT NULL
    AND
    session.time_out IS NULL
    """);

    return data.map<RoomSession>((e) {
      Map<String, dynamic> _e = Map.of(e);
      RoomSession session = RoomSession.fromJson(_e);
      return session..guest = GuestTable.fromJson(_e);
    }).toList();
  }
}

extension RoomJoinCourseSessionQuery on CourseSessionQuery {
  Future<List<CourseSession>> getCurrent() async {
    List<Map<String, dynamic>> data = await db.rawQuery("""
    SELECT session.*, ${CourseTable.sqlSelect}
    FROM session
    INNER JOIN course ON course.id = session.course_id
    WHERE
    ${CourseSessionTable.sqlFindSchema}
    AND
    session.time_out IS NULL
    """);

    return data.map<CourseSession>((e) {
      Map<String, dynamic> _e = Map.of(e);
      CourseSession session = CourseSession.fromJson(_e);
      return session..course = CourseTable.fromJson(_e);
    }).toList();
  }
}

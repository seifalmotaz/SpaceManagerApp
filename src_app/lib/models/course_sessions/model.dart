import 'dart:convert';

import 'package:spacemanager/constants/func.dart';
export 'crud_query.dart';

CourseSession courseSessionFromMap(String str) =>
    CourseSession.fromMap(json.decode(str));
String courseSessionToMap(CourseSession data) => json.encode(data.toMap());

class CourseSession {
  CourseSession({
    this.id,
    this.guestId,
    this.courseSessionId,
    this.courseReservationId,
    this.createdDate,
    this.courseId,
  });

  int? id;
  int? guestId;
  int? courseSessionId;
  int? courseReservationId;
  int? courseId;
  DateTime? createdDate;

  factory CourseSession.fromMap(Map<String, dynamic> json) => CourseSession(
        guestId: json["guest_id"],
        courseSessionId: json["course_session_id"],
        courseReservationId: json["course_reservation_id"],
        createdDate: fromDateDB(json["created_date"]),
        courseId: json["course_id"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "guest_id": guestId,
        "course_session_id": courseSessionId,
        "course_reservation_id": courseReservationId,
        "course_id": courseId,
      };
}

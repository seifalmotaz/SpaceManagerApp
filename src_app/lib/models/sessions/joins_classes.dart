import 'package:spacemanager/models/courses/model.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/models/sessions/model.dart';

import 'crud_query.dart';

class SessionWithGuest {
  int? guestId;
  Guest? guest;
  Session session;
  SessionWithGuest({
    this.guestId,
    this.guest,
    required this.session,
  });
}

class SessionWithCourse {
  int? reservationId;
  int? roomId;
  int? courseId;
  int? billsCount;
  Course course;
  Session session;
  SessionWithCourse({
    this.reservationId,
    this.roomId,
    this.courseId,
    this.billsCount,
    required this.course,
    required this.session,
  });
  Future<Session> get fullSession async => await SessionQuery.read(session.id!);
}

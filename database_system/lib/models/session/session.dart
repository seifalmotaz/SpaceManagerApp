import 'package:engine_sql/engine_sql.dart';
import 'package:database_system/models/func.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';

class Session {
  int id;
  // main data
  @dateTimeKey
  DateTime timeIn;
  @dateTimeKey
  DateTime timeOut;
  Session({
    required this.id,
    required this.timeIn,
    required this.timeOut,
  });
}

@JsonSerializable(fieldRename: FieldRename.snake)
@EngineSQL('session')
class GuestSession extends Session {
  int guestCount;
  int priceId;
  double paidAmount;
  int guestId;

  GuestSession({
    required this.guestCount,
    required this.paidAmount,
    required this.guestId,
    required this.priceId,
    required id,
    required timeIn,
    required timeOut,
  }) : super(
          id: id,
          timeIn: timeIn,
          timeOut: timeOut,
        );

  factory GuestSession.fromJson(Map<String, dynamic> json) =>
      _$GuestSessionFromJson(json);
  Map<String, dynamic> toJson() => _$GuestSessionToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
@EngineSQL('session')
class RoomSession extends Session {
  int roomId;
  double paidAmount;
  int guestId;
  int reservationId;

  RoomSession({
    required this.paidAmount,
    required this.guestId,
    required this.roomId,
    required this.reservationId,
    required id,
    required timeIn,
    required timeOut,
  }) : super(
          id: id,
          timeIn: timeIn,
          timeOut: timeOut,
        );

  factory RoomSession.fromJson(Map<String, dynamic> json) =>
      _$RoomSessionFromJson(json);
  Map<String, dynamic> toJson() => _$RoomSessionToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
@EngineSQL('session')
class CourseSession extends Session {
  int courseId;
  int guestCount;
  int reservationId;

  CourseSession({
    required this.courseId,
    required this.guestCount,
    required this.reservationId,
    required id,
    required timeIn,
    required timeOut,
  }) : super(
          id: id,
          timeIn: timeIn,
          timeOut: timeOut,
        );

  factory CourseSession.fromJson(Map<String, dynamic> json) =>
      _$CourseSessionFromJson(json);
  Map<String, dynamic> toJson() => _$CourseSessionToJson(this);
}

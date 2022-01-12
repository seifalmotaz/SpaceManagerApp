import 'package:engine_sql/engine_sql.dart';
import 'package:database_system/models/func.dart';
import 'package:database_system/db/service.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';

class Session {
  @FieldSQL(primary: true)
  final int id;
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

  factory Session.fromJson(Map<String, dynamic> json) {
    dynamic session;
    session ??= GuestSessionTable.schemaToJson(json);
    session ??= RoomSessionTable.schemaToJson(json);
    session ??= CourseSessionTable.schemaToJson(json);
    return session!;
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
@EngineSQL(name: 'session', sqlite: 'DBService.to.db')
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

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
@EngineSQL(name: 'session', sqlite: 'DBService.to.db')
class RoomSession extends Session {
  int roomId;
  double paidAmount;
  int guestId;
  int? reservationId;

  RoomSession({
    required this.paidAmount,
    required this.guestId,
    required this.roomId,
    required id,
    required timeIn,
    required timeOut,
    this.reservationId,
  }) : super(
          id: id,
          timeIn: timeIn,
          timeOut: timeOut,
        );

  factory RoomSession.fromJson(Map<String, dynamic> json) =>
      _$RoomSessionFromJson(json);
  Map<String, dynamic> toJson() => _$RoomSessionToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
@EngineSQL(name: 'session', sqlite: 'DBService.to.db')
class CourseSession extends Session {
  int roomId;
  int courseId;
  int guestCount;
  int reservationId;

  CourseSession({
    required this.roomId,
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

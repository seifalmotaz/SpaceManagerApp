import 'package:database_system/database_system.dart';
import 'package:engine_sql_annotation/engine_sql_annotation.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:database_system/models/func.dart';

import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';

mixin Joins {
  @JsonKey(ignore: true)
  Price? price;
  @JsonKey(ignore: true)
  Guest? guest;
  @JsonKey(ignore: true)
  Room? room;
  @JsonKey(ignore: true)
  Reservation? reservation;
  @JsonKey(ignore: true)
  Course? course;
}

class Session {
  @FieldSQL(primary: true)
  final int id;
  // main data
  @dateTimeKey
  @FieldSQL(haveDefault: true)
  DateTime timeIn;
  @dateNullTimeKey
  DateTime? timeOut;
  Session({
    required this.id,
    required this.timeIn,
    this.timeOut,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    dynamic session;
    session ??= GuestSession$CustomTable.schemaToJson(json);
    session ??= GuestSessionTable.schemaToJson(json);
    session ??= RoomSessionTable.schemaToJson(json);
    session ??= CourseSessionTable.schemaToJson(json);
    return session!;
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
@EngineSQL(name: 'session')
class StaffSession extends Session with Joins {
  int guestId;

  StaffSession({
    required this.guestId,
    required id,
    required timeIn,
    required timeOut,
  }) : super(
          id: id,
          timeIn: timeIn,
          timeOut: timeOut,
        );

  factory StaffSession.fromJson(Map<String, dynamic> json) =>
      _$StaffSessionFromJson(json);
  Map<String, dynamic> toJson() => _$StaffSessionToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
@EngineSQL(name: 'session')
class GuestSession$Custom extends Session with Joins {
  int guestCount;
  double? paidAmount;
  int guestId;

  @boolKey
  bool customPaid;

  GuestSession$Custom({
    required this.guestCount,
    required this.guestId,
    required id,
    required timeIn,
    required timeOut,
    required this.customPaid,
    this.paidAmount,
  }) : super(
          id: id,
          timeIn: timeIn,
          timeOut: timeOut,
        );

  factory GuestSession$Custom.fromJson(Map<String, dynamic> json) =>
      _$GuestSession$CustomFromJson(json);
  Map<String, dynamic> toJson() => _$GuestSession$CustomToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
@EngineSQL(name: 'session')
class GuestSession extends Session with Joins {
  int guestCount;
  int priceId;
  double? paidAmount;
  int guestId;

  @boolNullKey
  bool? customPaid;

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
@EngineSQL(name: 'session')
class ReservationSession extends Session with Joins {
  int roomId;
  double? paidAmount;
  int guestId;
  int reservationId;

  @boolKey
  @FieldSQL(haveDefault: true)
  bool customPaid;

  ReservationSession({
    required this.paidAmount,
    required this.guestId,
    required this.roomId,
    required id,
    required timeIn,
    required timeOut,
    required this.reservationId,
    required this.customPaid,
  }) : super(
          id: id,
          timeIn: timeIn,
          timeOut: timeOut,
        );

  factory ReservationSession.fromJson(Map<String, dynamic> json) =>
      _$ReservationSessionFromJson(json);
  Map<String, dynamic> toJson() => _$ReservationSessionToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
@EngineSQL(name: 'session')
class RoomSession extends Session with Joins {
  int roomId;
  double? paidAmount;
  int guestId;

  @boolKey
  @FieldSQL(haveDefault: true)
  bool customPaid;

  RoomSession({
    required this.paidAmount,
    required this.guestId,
    required this.roomId,
    required id,
    required timeIn,
    required timeOut,
    required this.customPaid,
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
@EngineSQL(name: 'session')
class CourseSession extends Session with Joins {
  int roomId;
  int courseId;
  int reservationId;

  CourseSession({
    required this.roomId,
    required this.courseId,
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

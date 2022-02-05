import 'package:database_system/database_system.dart';
import 'package:engine_sql_annotation/engine_sql_annotation.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:database_system/models/func.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reservation.g.dart';

mixin ReservationJoins {
  @JsonKey(ignore: true)
  Guest? guest;
  @JsonKey(ignore: true)
  Course? course;
  @JsonKey(ignore: true)
  Room? room;
}

class Reservation {
  @FieldSQL(primary: true)
  final int id;

  int guestId;
  int roomId;
  String primaryName;

  @boolKey
  @FieldSQL(haveDefault: true)
  bool isCancelled;

  // main data
  @dateTimeKey
  DateTime timeIn;
  @dateTimeKey
  DateTime timeOut;

  @dateNullTimeKey
  @FieldSQL(haveDefault: true)
  DateTime? createdDate;

  Reservation({
    required this.guestId,
    required this.id,
    required this.timeIn,
    required this.timeOut,
    required this.roomId,
    required this.primaryName,
    required this.createdDate,
    this.isCancelled = false,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    dynamic reservation;
    reservation ??= CourseReservationTable.schemaToJson(json);
    reservation ??= GuestReservationTable.schemaToJson(json);
    return reservation!;
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
@EngineSQL(name: 'reservation')
class CourseReservation extends Reservation with ReservationJoins {
  int courseId;

  CourseReservation({
    required this.courseId,
    required createdDate,
    required guestId,
    required id,
    required timeIn,
    required timeOut,
    required roomId,
    required primaryName,
    isCancelled = false,
  }) : super(
          primaryName: primaryName,
          roomId: roomId,
          createdDate: createdDate,
          guestId: guestId,
          id: id,
          timeIn: timeIn,
          timeOut: timeOut,
          isCancelled: isCancelled,
        );
  factory CourseReservation.fromJson(Map<String, dynamic> json) =>
      _$CourseReservationFromJson(json);
  Map<String, dynamic> toJson() => _$CourseReservationToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
@EngineSQL(name: 'reservation')
class GuestReservation extends Reservation with ReservationJoins {
  double paidAmount;

  GuestReservation({
    required this.paidAmount,
    required createdDate,
    required guestId,
    required id,
    required timeIn,
    required timeOut,
    required roomId,
    isCancelled,
    primaryName,
  }) : super(
          primaryName: primaryName,
          roomId: roomId,
          createdDate: createdDate,
          guestId: guestId,
          id: id,
          timeIn: timeIn,
          timeOut: timeOut,
          isCancelled: isCancelled,
        );
  factory GuestReservation.fromJson(Map<String, dynamic> json) =>
      _$GuestReservationFromJson(json);
  Map<String, dynamic> toJson() => _$GuestReservationToJson(this);
}

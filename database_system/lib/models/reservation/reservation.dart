import 'package:engine_sql_annotation/engine_sql_annotation.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:database_system/models/func.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reservation.g.dart';

class Reservation {
  @FieldSQL(primary: true)
  final int id;
  int guestId;
  int courseId;

  @boolKey
  bool isCancelled;
  // main data
  @dateTimeKey
  DateTime timeIn;
  @dateTimeKey
  DateTime timeOut;
  @dateTimeKey
  DateTime createdDate;

  Reservation({
    required this.createdDate,
    required this.guestId,
    required this.id,
    required this.timeIn,
    required this.timeOut,
    required this.courseId,
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
class CourseReservation extends Reservation {
  int roomId;

  CourseReservation({
    required courseId,
    required this.roomId,
    required createdDate,
    required guestId,
    required id,
    required timeIn,
    required timeOut,
    isCancelled = false,
  }) : super(
          courseId: courseId,
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
class GuestReservation extends Reservation {
  double paidAmount;

  GuestReservation({
    required courseId,
    required this.paidAmount,
    required createdDate,
    required guestId,
    required id,
    required timeIn,
    required timeOut,
    isCancelled = false,
  }) : super(
          courseId: courseId,
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

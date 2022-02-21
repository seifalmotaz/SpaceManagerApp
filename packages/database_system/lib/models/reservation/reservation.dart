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

  int roomId;
  String tag;
  int? capacity;

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

  @boolNullKey
  @FieldSQL(haveDefault: true)
  bool? customPaid;

  Reservation({
    required this.id,
    required this.timeIn,
    required this.timeOut,
    required this.roomId,
    required this.tag,
    required this.createdDate,
    this.isCancelled = false,
    this.customPaid = false,
    this.capacity,
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
    required id,
    required timeIn,
    required timeOut,
    required roomId,
    required tag,
    isCancelled = false,
    customPaid = false,
    capacity,
  }) : super(
          tag: tag,
          roomId: roomId,
          createdDate: createdDate,
          id: id,
          customPaid: customPaid,
          timeIn: timeIn,
          timeOut: timeOut,
          isCancelled: isCancelled,
          capacity: capacity,
        );
  factory CourseReservation.fromJson(Map<String, dynamic> json) =>
      _$CourseReservationFromJson(json);
  Map<String, dynamic> toJson() => _$CourseReservationToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
@EngineSQL(name: 'reservation')
class GuestReservation extends Reservation with ReservationJoins {
  double paidAmount;
  int guestId;
  double? extraHoursPrice;

  GuestReservation({
    required this.paidAmount,
    required this.guestId,
    required createdDate,
    this.extraHoursPrice,
    required id,
    required timeIn,
    required timeOut,
    required roomId,
    required tag,
    isCancelled,
    customPaid,
    capacity,
  }) : super(
          tag: tag,
          roomId: roomId,
          createdDate: createdDate,
          id: id,
          customPaid: customPaid,
          timeIn: timeIn,
          timeOut: timeOut,
          isCancelled: isCancelled,
          capacity: capacity,
        );
  factory GuestReservation.fromJson(Map<String, dynamic> json) =>
      _$GuestReservationFromJson(json);
  Map<String, dynamic> toJson() => _$GuestReservationToJson(this);
}

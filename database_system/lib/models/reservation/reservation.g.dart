// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseReservation _$CourseReservationFromJson(Map<String, dynamic> json) =>
    CourseReservation(
      courseId: json['course_id'],
      roomId: json['room_id'] as int,
      createdDate: DataCompiler.fromDBDate(json['created_date'] as int),
      guestId: json['guest_id'],
      id: json['id'],
      timeIn: DataCompiler.fromDBDate(json['time_in'] as int),
      timeOut: DataCompiler.fromDBDate(json['time_out'] as int),
      isCancelled: json['is_cancelled'] == null
          ? false
          : DataCompiler.fromDBool(json['is_cancelled'] as int),
    );

Map<String, dynamic> _$CourseReservationToJson(CourseReservation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guest_id': instance.guestId,
      'course_id': instance.courseId,
      'is_cancelled': DataCompiler.toDBool(instance.isCancelled),
      'time_in': DataCompiler.toDBDate(instance.timeIn),
      'time_out': DataCompiler.toDBDate(instance.timeOut),
      'created_date': DataCompiler.toDBDate(instance.createdDate),
      'room_id': instance.roomId,
    };

GuestReservation _$GuestReservationFromJson(Map<String, dynamic> json) =>
    GuestReservation(
      courseId: json['course_id'],
      paidAmount: (json['paid_amount'] as num).toDouble(),
      createdDate: DataCompiler.fromDBDate(json['created_date'] as int),
      guestId: json['guest_id'],
      id: json['id'],
      timeIn: DataCompiler.fromDBDate(json['time_in'] as int),
      timeOut: DataCompiler.fromDBDate(json['time_out'] as int),
      isCancelled: json['is_cancelled'] == null
          ? false
          : DataCompiler.fromDBool(json['is_cancelled'] as int),
    );

Map<String, dynamic> _$GuestReservationToJson(GuestReservation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guest_id': instance.guestId,
      'course_id': instance.courseId,
      'is_cancelled': DataCompiler.toDBool(instance.isCancelled),
      'time_in': DataCompiler.toDBDate(instance.timeIn),
      'time_out': DataCompiler.toDBDate(instance.timeOut),
      'created_date': DataCompiler.toDBDate(instance.createdDate),
      'paid_amount': instance.paidAmount,
    };

// **************************************************************************
// Generator: QuerysGen
// **************************************************************************

// hello

// **************************************************************************
// Generator: SqlFieldsGen
// **************************************************************************

extension CourseReservationTable on CourseReservation {
  static Map<String, dynamic> getStartWithString_(String string, Map data) {
    Map<String, dynamic> newData = {};
    for (String key in data.keys.toList()) {
      if (key.startsWith(string)) {
        String k = key.substring(string.length + 1);
        newData.addAll({k: data[key]});
      }
    }
    return newData;
  }

  /// Field data: field ///
  static String roomId = 'room_id';
  static String nativeRoomId = 'reservation.room_id';

  /// Field data: field ///
  static String id = 'id';
  static String nativeId = 'reservation.id';

  /// Field data: field ///
  static String guestId = 'guest_id';
  static String nativeGuestId = 'reservation.guest_id';

  /// Field data: field ///
  static String courseId = 'course_id';
  static String nativeCourseId = 'reservation.course_id';

  /// Field data: field ///
  static String isCancelled = 'is_cancelled';
  static String nativeIsCancelled = 'reservation.is_cancelled';

  /// Field data: field ///
  static String timeIn = 'time_in';
  static String nativeTimeIn = 'reservation.time_in';

  /// Field data: field ///
  static String timeOut = 'time_out';
  static String nativeTimeOut = 'reservation.time_out';

  /// Field data: field ///
  static String createdDate = 'created_date';
  static String nativeCreatedDate = 'reservation.created_date';

  static const String sqlSelect = """
    reservation.room_id AS reservation_room_id,
    reservation.id AS reservation_id,
    reservation.guest_id AS reservation_guest_id,
    reservation.course_id AS reservation_course_id,
    reservation.is_cancelled AS reservation_is_cancelled,
    reservation.time_in AS reservation_time_in,
    reservation.time_out AS reservation_time_out,
    reservation.created_date AS reservation_created_date,
  """;

  static fromJson(Map<String, dynamic> json) =>
      _$CourseReservationFromJson(getStartWithString_('reservation', json));
}

extension GuestReservationTable on GuestReservation {
  static Map<String, dynamic> getStartWithString_(String string, Map data) {
    Map<String, dynamic> newData = {};
    for (String key in data.keys.toList()) {
      if (key.startsWith(string)) {
        String k = key.substring(string.length + 1);
        newData.addAll({k: data[key]});
      }
    }
    return newData;
  }

  /// Field data: field ///
  static String paidAmount = 'paid_amount';
  static String nativePaidAmount = 'reservation.paid_amount';

  /// Field data: field ///
  static String id = 'id';
  static String nativeId = 'reservation.id';

  /// Field data: field ///
  static String guestId = 'guest_id';
  static String nativeGuestId = 'reservation.guest_id';

  /// Field data: field ///
  static String courseId = 'course_id';
  static String nativeCourseId = 'reservation.course_id';

  /// Field data: field ///
  static String isCancelled = 'is_cancelled';
  static String nativeIsCancelled = 'reservation.is_cancelled';

  /// Field data: field ///
  static String timeIn = 'time_in';
  static String nativeTimeIn = 'reservation.time_in';

  /// Field data: field ///
  static String timeOut = 'time_out';
  static String nativeTimeOut = 'reservation.time_out';

  /// Field data: field ///
  static String createdDate = 'created_date';
  static String nativeCreatedDate = 'reservation.created_date';

  static const String sqlSelect = """
    reservation.paid_amount AS reservation_paid_amount,
    reservation.id AS reservation_id,
    reservation.guest_id AS reservation_guest_id,
    reservation.course_id AS reservation_course_id,
    reservation.is_cancelled AS reservation_is_cancelled,
    reservation.time_in AS reservation_time_in,
    reservation.time_out AS reservation_time_out,
    reservation.created_date AS reservation_created_date,
  """;

  static fromJson(Map<String, dynamic> json) =>
      _$GuestReservationFromJson(getStartWithString_('reservation', json));
}

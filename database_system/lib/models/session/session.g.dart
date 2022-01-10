// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuestSession _$GuestSessionFromJson(Map<String, dynamic> json) => GuestSession(
      guestCount: json['guest_count'] as int,
      paidAmount: (json['paid_amount'] as num).toDouble(),
      guestId: json['guest_id'] as int,
      priceId: json['price_id'] as int,
      id: json['id'],
      timeIn: DataCompiler.fromDBDate(json['time_in'] as int),
      timeOut: DataCompiler.fromDBDate(json['time_out'] as int),
    );

Map<String, dynamic> _$GuestSessionToJson(GuestSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'time_in': DataCompiler.toDBDate(instance.timeIn),
      'time_out': DataCompiler.toDBDate(instance.timeOut),
      'guest_count': instance.guestCount,
      'price_id': instance.priceId,
      'paid_amount': instance.paidAmount,
      'guest_id': instance.guestId,
    };

RoomSession _$RoomSessionFromJson(Map<String, dynamic> json) => RoomSession(
      paidAmount: (json['paid_amount'] as num).toDouble(),
      guestId: json['guest_id'] as int,
      roomId: json['room_id'] as int,
      reservationId: json['reservation_id'] as int,
      id: json['id'],
      timeIn: DataCompiler.fromDBDate(json['time_in'] as int),
      timeOut: DataCompiler.fromDBDate(json['time_out'] as int),
    );

Map<String, dynamic> _$RoomSessionToJson(RoomSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'time_in': DataCompiler.toDBDate(instance.timeIn),
      'time_out': DataCompiler.toDBDate(instance.timeOut),
      'room_id': instance.roomId,
      'paid_amount': instance.paidAmount,
      'guest_id': instance.guestId,
      'reservation_id': instance.reservationId,
    };

CourseSession _$CourseSessionFromJson(Map<String, dynamic> json) =>
    CourseSession(
      courseId: json['course_id'] as int,
      guestCount: json['guest_count'] as int,
      reservationId: json['reservation_id'] as int,
      id: json['id'],
      timeIn: DataCompiler.fromDBDate(json['time_in'] as int),
      timeOut: DataCompiler.fromDBDate(json['time_out'] as int),
    );

Map<String, dynamic> _$CourseSessionToJson(CourseSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'time_in': DataCompiler.toDBDate(instance.timeIn),
      'time_out': DataCompiler.toDBDate(instance.timeOut),
      'course_id': instance.courseId,
      'guest_count': instance.guestCount,
      'reservation_id': instance.reservationId,
    };

// **************************************************************************
// Generator: QuerysGen
// **************************************************************************

// hello

// **************************************************************************
// Generator: SqlFieldsGen
// **************************************************************************

extension GuestSessionTable on GuestSession {
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
  static String guestCount = 'guest_count';
  static String nativeGuestCount = 'session.guest_count';

  /// Field data: field ///
  static String priceId = 'price_id';
  static String nativePriceId = 'session.price_id';

  /// Field data: field ///
  static String paidAmount = 'paid_amount';
  static String nativePaidAmount = 'session.paid_amount';

  /// Field data: field ///
  static String guestId = 'guest_id';
  static String nativeGuestId = 'session.guest_id';

  /// Field data: field ///
  static String id = 'id';
  static String nativeId = 'session.id';

  /// Field data: field ///
  static String timeIn = 'time_in';
  static String nativeTimeIn = 'session.time_in';

  /// Field data: field ///
  static String timeOut = 'time_out';
  static String nativeTimeOut = 'session.time_out';

  static const String sqlSelect = """
    session.guest_count AS session_guest_count,
    session.price_id AS session_price_id,
    session.paid_amount AS session_paid_amount,
    session.guest_id AS session_guest_id,
    session.id AS session_id,
    session.time_in AS session_time_in,
    session.time_out AS session_time_out,
  """;

  static fromJson(Map<String, dynamic> json) =>
      _$GuestSessionFromJson(getStartWithString_('session', json));
}

extension RoomSessionTable on RoomSession {
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
  static String nativeRoomId = 'session.room_id';

  /// Field data: field ///
  static String paidAmount = 'paid_amount';
  static String nativePaidAmount = 'session.paid_amount';

  /// Field data: field ///
  static String guestId = 'guest_id';
  static String nativeGuestId = 'session.guest_id';

  /// Field data: field ///
  static String reservationId = 'reservation_id';
  static String nativeReservationId = 'session.reservation_id';

  /// Field data: field ///
  static String id = 'id';
  static String nativeId = 'session.id';

  /// Field data: field ///
  static String timeIn = 'time_in';
  static String nativeTimeIn = 'session.time_in';

  /// Field data: field ///
  static String timeOut = 'time_out';
  static String nativeTimeOut = 'session.time_out';

  static const String sqlSelect = """
    session.room_id AS session_room_id,
    session.paid_amount AS session_paid_amount,
    session.guest_id AS session_guest_id,
    session.reservation_id AS session_reservation_id,
    session.id AS session_id,
    session.time_in AS session_time_in,
    session.time_out AS session_time_out,
  """;

  static fromJson(Map<String, dynamic> json) =>
      _$RoomSessionFromJson(getStartWithString_('session', json));
}

extension CourseSessionTable on CourseSession {
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
  static String courseId = 'course_id';
  static String nativeCourseId = 'session.course_id';

  /// Field data: field ///
  static String guestCount = 'guest_count';
  static String nativeGuestCount = 'session.guest_count';

  /// Field data: field ///
  static String reservationId = 'reservation_id';
  static String nativeReservationId = 'session.reservation_id';

  /// Field data: field ///
  static String id = 'id';
  static String nativeId = 'session.id';

  /// Field data: field ///
  static String timeIn = 'time_in';
  static String nativeTimeIn = 'session.time_in';

  /// Field data: field ///
  static String timeOut = 'time_out';
  static String nativeTimeOut = 'session.time_out';

  static const String sqlSelect = """
    session.course_id AS session_course_id,
    session.guest_count AS session_guest_count,
    session.reservation_id AS session_reservation_id,
    session.id AS session_id,
    session.time_in AS session_time_in,
    session.time_out AS session_time_out,
  """;

  static fromJson(Map<String, dynamic> json) =>
      _$CourseSessionFromJson(getStartWithString_('session', json));
}

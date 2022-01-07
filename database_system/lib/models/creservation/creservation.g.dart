// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CReservation _$$_CReservationFromJson(Map<String, dynamic> json) =>
    _$_CReservation(
      id: json['id'] as int?,
      courseId: json['course_id'] as int?,
      roomId: json['room_id'] as int?,
      timeIn: DataCompiler.fromDBDate(json['time_in'] as int?),
      timeOut: DataCompiler.fromDBDate(json['time_out'] as int?),
      createdDate: DataCompiler.fromDBDate(json['created_date'] as int?),
    );

Map<String, dynamic> _$$_CReservationToJson(_$_CReservation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_id': instance.courseId,
      'room_id': instance.roomId,
      'time_in': DataCompiler.toDBDate(instance.timeIn),
      'time_out': DataCompiler.toDBDate(instance.timeOut),
      'created_date': DataCompiler.toDBDate(instance.createdDate),
    };

// **************************************************************************
// EngineSQLGenerator
// **************************************************************************

extension CReservationFieldsSQL on CReservationFields {
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

// \ // \ Start: id // \ // \
  static String nativeId = 'creservation.id';
  static String id = 'id';
// \ // \ End: id // \ // \
// \ // \ Start: courseId // \ // \
  static String nativeCourseId = 'creservation.course_id';
  static String courseId = 'course_id';
// \ // \ End: courseId // \ // \
// \ // \ Start: roomId // \ // \
  static String nativeRoomId = 'creservation.room_id';
  static String roomId = 'room_id';
// \ // \ End: roomId // \ // \
// \ // \ Start: timeIn // \ // \
  static String nativeTimeIn = 'creservation.time_in';
  static String timeIn = 'time_in';
// \ // \ End: timeIn // \ // \
// \ // \ Start: timeOut // \ // \
  static String nativeTimeOut = 'creservation.time_out';
  static String timeOut = 'time_out';
// \ // \ End: timeOut // \ // \
// \ // \ Start: createdDate // \ // \
  static String nativeCreatedDate = 'creservation.created_date';
  static String createdDate = 'created_date';
// \ // \ End: createdDate // \ // \

  static fromJson(Map<String, dynamic> json) =>
      _$$_CReservationFromJson(getStartWithString_('creservation', json));
}

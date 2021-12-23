// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Reservation _$$_ReservationFromJson(Map<String, dynamic> json) =>
    _$_Reservation(
      id: json['id'] as int?,
      isPrePaId: json['is_pre_paid'] as bool?,
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      endTime: json['end_time'] == null
          ? null
          : DateTime.parse(json['end_time'] as String),
      roomId: json['room_id'] as int,
      courseId: json['course_id'] as int?,
      guestId: json['guest_id'] as int,
    );

Map<String, dynamic> _$$_ReservationToJson(_$_Reservation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_pre_paid': instance.isPrePaId,
      'start_time': instance.startTime?.toIso8601String(),
      'end_time': instance.endTime?.toIso8601String(),
      'room_id': instance.roomId,
      'course_id': instance.courseId,
      'guest_id': instance.guestId,
    };

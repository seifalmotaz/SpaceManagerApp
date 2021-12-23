// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Session _$$_SessionFromJson(Map<String, dynamic> json) => _$_Session(
      id: json['id'] as int?,
      guestsCount: json['guests_count'] as int?,
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      endTime: json['end_time'] == null
          ? null
          : DateTime.parse(json['end_time'] as String),
      guestId: json['guest_id'] as int,
      roomId: json['room_id'] as int?,
      priceId: json['price_id'] as int?,
      courseId: json['course_id'] as int?,
      reservationId: json['reservation_id'] as int?,
    );

Map<String, dynamic> _$$_SessionToJson(_$_Session instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guests_count': instance.guestsCount,
      'start_time': instance.startTime?.toIso8601String(),
      'end_time': instance.endTime?.toIso8601String(),
      'guest_id': instance.guestId,
      'room_id': instance.roomId,
      'price_id': instance.priceId,
      'course_id': instance.courseId,
      'reservation_id': instance.reservationId,
    };

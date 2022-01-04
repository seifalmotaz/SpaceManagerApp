// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rsession.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RSession _$$_RSessionFromJson(Map<String, dynamic> json) => _$_RSession(
      id: json['id'] as int,
      guestId: json['guest_id'] as int,
      roomId: json['room_id'] as int,
      paidAmount: (json['paid_amount'] as num).toDouble(),
      timeIn: DateTime.parse(json['time_in'] as String),
      timeOut: json['time_out'] == null
          ? null
          : DateTime.parse(json['time_out'] as String),
    );

Map<String, dynamic> _$$_RSessionToJson(_$_RSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guest_id': instance.guestId,
      'room_id': instance.roomId,
      'paid_amount': instance.paidAmount,
      'time_in': instance.timeIn.toIso8601String(),
      'time_out': instance.timeOut?.toIso8601String(),
    };

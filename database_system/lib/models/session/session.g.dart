// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Session _$$_SessionFromJson(Map<String, dynamic> json) => _$_Session(
      id: json['id'] as int,
      guestId: json['guest_id'] as int,
      priceId: json['price_id'] as int,
      paidAmount: (json['paid_amount'] as num).toDouble(),
      guestCount: json['guest_count'] as int,
      timeIn: DateTime.parse(json['time_in'] as String),
      timeOut: json['time_out'] == null
          ? null
          : DateTime.parse(json['time_out'] as String),
    );

Map<String, dynamic> _$$_SessionToJson(_$_Session instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guest_id': instance.guestId,
      'price_id': instance.priceId,
      'paid_amount': instance.paidAmount,
      'guest_count': instance.guestCount,
      'time_in': instance.timeIn.toIso8601String(),
      'time_out': instance.timeOut?.toIso8601String(),
    };

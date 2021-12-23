// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Bill _$$_BillFromJson(Map<String, dynamic> json) => _$_Bill(
      id: json['id'] as int,
      total: (json['total'] as num).toDouble(),
      staffId: json['staff_id'] as int,
      sessionId: json['session_id'] as int,
      reservationId: json['reservation_id'] as int,
    );

Map<String, dynamic> _$$_BillToJson(_$_Bill instance) => <String, dynamic>{
      'id': instance.id,
      'total': instance.total,
      'staff_id': instance.staffId,
      'session_id': instance.sessionId,
      'reservation_id': instance.reservationId,
    };

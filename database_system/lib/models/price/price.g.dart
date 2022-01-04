// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Price _$$_PriceFromJson(Map<String, dynamic> json) => _$_Price(
      id: json['id'] as int,
      rate: (json['rate'] as num).toDouble(),
      description: json['description'] as String,
      isDefault: json['is_default'] as bool,
      isDeleted: json['is_deleted'] as bool,
      isPerDay: json['is_per_day'] as bool,
      createdDate: DateTime.parse(json['created_date'] as String),
    );

Map<String, dynamic> _$$_PriceToJson(_$_Price instance) => <String, dynamic>{
      'id': instance.id,
      'rate': instance.rate,
      'description': instance.description,
      'is_default': instance.isDefault,
      'is_deleted': instance.isDeleted,
      'is_per_day': instance.isPerDay,
      'created_date': instance.createdDate.toIso8601String(),
    };

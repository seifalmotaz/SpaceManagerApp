// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Price _$$_PriceFromJson(Map<String, dynamic> json) => _$_Price(
      id: json['id'] as int,
      rate: (json['rate'] as num).toDouble(),
      description: json['description'] as String,
      isDefault: json['is_default'] as bool,
    );

Map<String, dynamic> _$$_PriceToJson(_$_Price instance) => <String, dynamic>{
      'id': instance.id,
      'rate': instance.rate,
      'description': instance.description,
      'is_default': instance.isDefault,
    };

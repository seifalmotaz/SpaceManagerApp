// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Price _$$_PriceFromJson(Map<String, dynamic> json) => _$_Price(
      id: json['id'] as int?,
      rate: (json['rate'] as num?)?.toDouble(),
      description: json['description'] as String?,
      isDefault: DataCompiler.fromDBool(json['is_default'] as int?),
      isDeleted: DataCompiler.fromDBool(json['is_deleted'] as int?),
      isPerDay: DataCompiler.fromDBool(json['is_per_day'] as int?),
      createdDate: DataCompiler.fromDBDate(json['created_date'] as int?),
    );

Map<String, dynamic> _$$_PriceToJson(_$_Price instance) => <String, dynamic>{
      'id': instance.id,
      'rate': instance.rate,
      'description': instance.description,
      'is_default': DataCompiler.toDBool(instance.isDefault),
      'is_deleted': DataCompiler.toDBool(instance.isDeleted),
      'is_per_day': DataCompiler.toDBool(instance.isPerDay),
      'created_date': DataCompiler.toDBDate(instance.createdDate),
    };

// **************************************************************************
// EngineSQLGenerator
// **************************************************************************

extension PriceFieldsSQL on PriceFields {
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
  static String nativeId = 'price.id';
  static String id = 'id';
// \ // \ End: id // \ // \
// \ // \ Start: rate // \ // \
  static String nativeRate = 'price.rate';
  static String rate = 'rate';
// \ // \ End: rate // \ // \
// \ // \ Start: description // \ // \
  static String nativeDescription = 'price.description';
  static String description = 'description';
// \ // \ End: description // \ // \
// \ // \ Start: isDefault // \ // \
  static String nativeIsDefault = 'price.is_default';
  static String isDefault = 'is_default';
// \ // \ End: isDefault // \ // \
// \ // \ Start: isDeleted // \ // \
  static String nativeIsDeleted = 'price.is_deleted';
  static String isDeleted = 'is_deleted';
// \ // \ End: isDeleted // \ // \
// \ // \ Start: isPerDay // \ // \
  static String nativeIsPerDay = 'price.is_per_day';
  static String isPerDay = 'is_per_day';
// \ // \ End: isPerDay // \ // \
// \ // \ Start: createdDate // \ // \
  static String nativeCreatedDate = 'price.created_date';
  static String createdDate = 'created_date';
// \ // \ End: createdDate // \ // \

  static fromJson(Map<String, dynamic> json) =>
      _$$_PriceFromJson(getStartWithString_('price', json));
}

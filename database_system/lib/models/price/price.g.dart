// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      createdDate: DataCompiler.fromDBDate(json['created_date'] as int),
      description: json['description'] as String,
      id: json['id'] as int,
      isDefault: DataCompiler.fromDBool(json['is_default'] as int),
      isDeleted: DataCompiler.fromDBool(json['is_deleted'] as int),
      isPerDay: DataCompiler.fromDBool(json['is_per_day'] as int),
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'id': instance.id,
      'rate': instance.rate,
      'description': instance.description,
      'is_default': DataCompiler.toDBool(instance.isDefault),
      'is_deleted': DataCompiler.toDBool(instance.isDeleted),
      'is_per_day': DataCompiler.toDBool(instance.isPerDay),
      'created_date': DataCompiler.toDBDate(instance.createdDate),
    };

// **************************************************************************
// Generator: QuerysGen
// **************************************************************************

// hello

// **************************************************************************
// Generator: SqlFieldsGen
// **************************************************************************

extension PriceTable on Price {
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
  static String id = 'id';
  static String nativeId = 'price.id';

  /// Field data: field ///
  static String rate = 'rate';
  static String nativeRate = 'price.rate';

  /// Field data: field ///
  static String description = 'description';
  static String nativeDescription = 'price.description';

  /// Field data: field ///
  static String isDefault = 'is_default';
  static String nativeIsDefault = 'price.is_default';

  /// Field data: field ///
  static String isDeleted = 'is_deleted';
  static String nativeIsDeleted = 'price.is_deleted';

  /// Field data: field ///
  static String isPerDay = 'is_per_day';
  static String nativeIsPerDay = 'price.is_per_day';

  /// Field data: field ///
  static String createdDate = 'created_date';
  static String nativeCreatedDate = 'price.created_date';

  static const String sqlSelect = """
    price.id AS price_id,
    price.rate AS price_rate,
    price.description AS price_description,
    price.is_default AS price_is_default,
    price.is_deleted AS price_is_deleted,
    price.is_per_day AS price_is_per_day,
    price.created_date AS price_created_date,
  """;

  static fromJson(Map<String, dynamic> json) =>
      _$PriceFromJson(getStartWithString_('price', json));
}

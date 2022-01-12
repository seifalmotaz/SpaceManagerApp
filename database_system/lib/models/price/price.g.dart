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
      options: DataCompiler.fromJsonString(json['options'] as String?),
    );

Map<String, dynamic> _$PriceToJson(Price instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'rate': instance.rate,
    'description': instance.description,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('options', DataCompiler.toJsonString(instance.options));
  writeNotNull('is_default', DataCompiler.toDBool(instance.isDefault));
  writeNotNull('is_deleted', DataCompiler.toDBool(instance.isDeleted));
  writeNotNull('is_per_day', DataCompiler.toDBool(instance.isPerDay));
  writeNotNull('created_date', DataCompiler.toDBDate(instance.createdDate));
  return val;
}

// **************************************************************************
// Generator: QuerysGen
// **************************************************************************

class PriceQuery {
  final Database db;
  PriceQuery(this.db);

  Future<int> create({
    double? rate,
    String? description,
    Map<dynamic, dynamic>? options,
    bool? isDefault,
    bool? isDeleted,
    bool? isPerDay,
    DateTime? createdDate,
  }) async =>
      await db.insert('price', {
        if (rate != null) 'rate': rate,
        if (description != null) 'description': description,
        if (options != null) 'options': options,
        if (isDefault != null) 'is_default': isDefault,
        if (isDeleted != null) 'is_deleted': isDeleted,
        if (isPerDay != null) 'is_per_day': isPerDay,
        if (createdDate != null) 'created_date': createdDate,
      });

  Future<Price> read(int id) async {
    List<Map<String, dynamic>> data = await db.query(
      'price',
      where: 'id = ?',
      whereArgs: [id],
    );
    return Price.fromJson(data.first);
  }

  Future<int> update({
    required int id,
    double? rate,
    String? description,
    Map<dynamic, dynamic>? options,
    bool? isDefault,
    bool? isDeleted,
    bool? isPerDay,
    DateTime? createdDate,
  }) async =>
      await db.update(
        'price',
        {
          if (rate != null) 'rate': rate,
          if (description != null) 'description': description,
          if (options != null) 'options': options,
          if (isDefault != null) 'is_default': isDefault,
          if (isDeleted != null) 'is_deleted': isDeleted,
          if (isPerDay != null) 'is_per_day': isPerDay,
          if (createdDate != null) 'created_date': createdDate,
        },
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<int> delete(int id) async => await db.delete(
        'price',
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<List<Price>> find({
    double? rate,
    String? description,
    Map<dynamic, dynamic>? options,
    bool? isDefault,
    bool? isDeleted,
    bool? isPerDay,
    DateTime? createdDate,
  }) async {
    List<Map<String, dynamic>> data = await db.query(
      'price',
      where: '''
          ${rate == null ? "" : "price.rate IS NOT NULL"}
          ${description == null ? "" : "AND price.description IS NOT NULL"}
          ${options == null ? "" : "AND price.options IS NOT NULL"}
          ${isDefault == null ? "" : "AND price.is_default IS NOT NULL"}
          ${isDeleted == null ? "" : "AND price.is_deleted IS NOT NULL"}
          ${isPerDay == null ? "" : "AND price.is_per_day IS NOT NULL"}
          ${createdDate == null ? "" : "AND price.created_date IS NOT NULL"}

          AND ${PriceTable.sqlFindSchema}
          ''',
      whereArgs: [
        rate,
        description,
        options,
        isDefault,
        isDeleted,
        isPerDay,
        createdDate,
      ],
    );

    return data.map((e) => Price.fromJson(e)).toList();
  }
}

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
  static String options = 'options';
  static String nativeOptions = 'price.options';

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
    price.options AS price_options,
    price.is_default AS price_is_default,
    price.is_deleted AS price_is_deleted,
    price.is_per_day AS price_is_per_day,
    price.created_date AS price_created_date,
  """;

  static const String sqlFindSchema = """
    price.id IS NOT NULL
    AND price.rate IS NOT NULL
    AND price.description IS NOT NULL
    AND price.is_default IS NOT NULL
    AND price.is_deleted IS NOT NULL
    AND price.is_per_day IS NOT NULL
    AND price.created_date IS NOT NULL
  """;

  static const List schemaMap = [
    'id',
    'rate',
    'description',
    'options',
    'is_default',
    'is_deleted',
    'is_per_day',
    'created_date',
  ];

  static fromJson(Map<String, dynamic> json) =>
      _$PriceFromJson(getStartWithString_('price', json));

  static Price? schemaToJson(Map<String, dynamic> json) {
    bool valid = true;

    for (String i in json.keys) {
      if (!schemaMap.contains(i)) {
        valid = false;
        break;
      }
    }

    if (valid) {
      return _$PriceFromJson(json);
    }
  }
}

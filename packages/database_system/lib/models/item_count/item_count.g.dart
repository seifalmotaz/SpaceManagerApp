// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemCount _$ItemCountFromJson(Map<String, dynamic> json) => ItemCount(
      id: json['id'] as int,
      insertCount: json['insert_count'] as int,
      currentCount: json['current_count'] as int,
      itemId: json['item_id'] as int,
      createdDate: DataCompiler.fromDBDateNull(json['created_date'] as int?),
    );

Map<String, dynamic> _$ItemCountToJson(ItemCount instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'insert_count': instance.insertCount,
    'current_count': instance.currentCount,
    'item_id': instance.itemId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('created_date', DataCompiler.toDBDateNull(instance.createdDate));
  return val;
}

// **************************************************************************
// Generator: QuerysGen
// **************************************************************************

class ItemCountQuery {
  final Database db;
  ItemCountQuery(this.db);

  Future<int> create({
    required int insertCount,
    required int currentCount,
    required int itemId,
    DateTime? createdDate,
  }) async =>
      await db.insert('item_count', {
        if (insertCount != null) 'insert_count': insertCount,
        if (currentCount != null) 'current_count': currentCount,
        if (itemId != null) 'item_id': itemId,
        if (createdDate != null)
          'created_date':
              (createdDate.millisecondsSinceEpoch / 1000).round() as int,
      });

  Future<ItemCount> read(int id) async {
    List<Map<String, dynamic>> data = await db.query(
      'item_count',
      where: 'id = ?',
      whereArgs: [id],
    );
    return ItemCount.fromJson(data.first);
  }

  Future<int> update({
    required int id,
    int? insertCount,
    int? currentCount,
    int? itemId,
    DateTime? createdDate,
  }) async =>
      await db.update(
        'item_count',
        {
          if (insertCount != null) 'insert_count': insertCount,
          if (currentCount != null) 'current_count': currentCount,
          if (itemId != null) 'item_id': itemId,
          if (createdDate != null)
            'created_date':
                (createdDate.millisecondsSinceEpoch / 1000).round() as int,
        },
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<int> delete(int id) async => await db.delete(
        'item_count',
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<List<ItemCount>> find({
    int? insertCount,
    int? currentCount,
    int? itemId,
    DateTime? createdDate,
  }) async {
    List<String> searchFields = [];
    if (insertCount != null) {
      searchFields.add("item_count.insert_count = ?");
    }
    if (currentCount != null) {
      searchFields.add("item_count.current_count = ?");
    }
    if (itemId != null) {
      searchFields.add("item_count.item_id = ?");
    }
    if (createdDate != null) {
      searchFields.add("item_count.created_date = ?");
    }

    StringBuffer buf = StringBuffer();
    for (int i = 0; i < searchFields.length; i++) {
      if (i == 0) buf.writeln(searchFields[i]);
      if (i != 0) buf.writeln("AND " + searchFields[i]);
    }

    List<Map<String, dynamic>> data = await db.query(
      'item_count',
      where: '''
          ${buf.toString()}
          ${buf.toString().isNotEmpty ? "AND" : ""} ${ItemCountTable.sqlFindSchema}
          ''',
      whereArgs: [
        if (insertCount != null) insertCount,
        if (currentCount != null) currentCount,
        if (itemId != null) itemId,
        if (createdDate != null)
          (createdDate.millisecondsSinceEpoch / 1000).round() as int,
      ],
    );

    return data.map((e) => ItemCount.fromJson(e)).toList();
  }
}

// **************************************************************************
// Generator: SqlFieldsGen
// **************************************************************************

extension ItemCountTable on ItemCount {
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
  static String nativeId = 'item_count.id';

  /// Field data: field ///
  static String insertCount = 'insert_count';
  static String nativeInsertCount = 'item_count.insert_count';

  /// Field data: field ///
  static String currentCount = 'current_count';
  static String nativeCurrentCount = 'item_count.current_count';

  /// Field data: field ///
  static String itemId = 'item_id';
  static String nativeItemId = 'item_count.item_id';

  /// Field data: field ///
  static String createdDate = 'created_date';
  static String nativeCreatedDate = 'item_count.created_date';

  static const String sqlSelect = """
    item_count.id AS item_count_id,
    item_count.insert_count AS item_count_insert_count,
    item_count.current_count AS item_count_current_count,
    item_count.item_id AS item_count_item_id,
    item_count.created_date AS item_count_created_date
  """;

  static const String sqlFindSchema = """
    item_count.id IS NOT NULL
    AND item_count.insert_count IS NOT NULL
    AND item_count.current_count IS NOT NULL
    AND item_count.item_id IS NOT NULL
  """;

  static const List schemaMap = [
    'id',
    'insert_count',
    'current_count',
    'item_id',
    'created_date',
  ];

  static fromJson(Map<String, dynamic> json) =>
      _$ItemCountFromJson(getStartWithString_('item_count', json));

  static ItemCount? schemaToJson(Map<String, dynamic> json) {
    bool valid = true;

    for (String i in json.keys) {
      if (!schemaMap.contains(i)) {
        valid = false;
        break;
      }
    }

    if (valid) {
      return _$ItemCountFromJson(json);
    }
  }

  static ItemCount? filterFromJson(Map<String, dynamic> json) =>
      schemaToJson(getStartWithString_('item_count', json));
}

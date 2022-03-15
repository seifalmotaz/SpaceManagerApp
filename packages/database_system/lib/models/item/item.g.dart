// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: json['id'] as int,
      price: (json['price'] as num).toDouble(),
      name: json['name'] as String,
      createdDate: DataCompiler.fromDBDateNull(json['created_date'] as int?),
    );

Map<String, dynamic> _$ItemToJson(Item instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'price': instance.price,
    'name': instance.name,
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

class ItemQuery {
  final Database db;
  ItemQuery(this.db);

  Future<int> create({
    required double price,
    required String name,
    DateTime? createdDate,
  }) async =>
      await db.insert('item', {
        if (price != null) 'price': price,
        if (name != null) 'name': name,
        if (createdDate != null)
          'created_date':
              (createdDate.millisecondsSinceEpoch / 1000).round() as int,
      });

  Future<Item> read(int id) async {
    List<Map<String, dynamic>> data = await db.query(
      'item',
      where: 'id = ?',
      whereArgs: [id],
    );
    return Item.fromJson(data.first);
  }

  Future<int> update({
    required int id,
    double? price,
    String? name,
    DateTime? createdDate,
  }) async =>
      await db.update(
        'item',
        {
          if (price != null) 'price': price,
          if (name != null) 'name': name,
          if (createdDate != null)
            'created_date':
                (createdDate.millisecondsSinceEpoch / 1000).round() as int,
        },
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<int> delete(int id) async => await db.delete(
        'item',
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<List<Item>> find({
    double? price,
    String? name,
    DateTime? createdDate,
  }) async {
    List<String> searchFields = [];
    if (price != null) {
      searchFields.add("item.price = ?");
    }
    if (name != null) {
      searchFields.add("item.name = ?");
    }
    if (createdDate != null) {
      searchFields.add("item.created_date = ?");
    }

    StringBuffer buf = StringBuffer();
    for (int i = 0; i < searchFields.length; i++) {
      if (i == 0) buf.writeln(searchFields[i]);
      if (i != 0) buf.writeln("AND " + searchFields[i]);
    }

    List<Map<String, dynamic>> data = await db.query(
      'item',
      where: '''
          ${buf.toString()}
          ${buf.toString().isNotEmpty ? "AND" : ""} ${ItemTable.sqlFindSchema}
          ''',
      whereArgs: [
        if (price != null) price,
        if (name != null) name,
        if (createdDate != null)
          (createdDate.millisecondsSinceEpoch / 1000).round() as int,
      ],
    );

    return data.map((e) => Item.fromJson(e)).toList();
  }
}

// **************************************************************************
// Generator: SqlFieldsGen
// **************************************************************************

extension ItemTable on Item {
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
  static String nativeId = 'item.id';

  /// Field data: field ///
  static String price = 'price';
  static String nativePrice = 'item.price';

  /// Field data: field ///
  static String name = 'name';
  static String nativeName = 'item.name';

  /// Field data: field ///
  static String createdDate = 'created_date';
  static String nativeCreatedDate = 'item.created_date';

  static const String sqlSelect = """
    item.id AS item_id,
    item.price AS item_price,
    item.name AS item_name,
    item.created_date AS item_created_date
  """;

  static const String sqlFindSchema = """
    item.id IS NOT NULL
    AND item.price IS NOT NULL
    AND item.name IS NOT NULL
  """;

  static const List schemaMap = [
    'id',
    'price',
    'name',
    'created_date',
  ];

  static fromJson(Map<String, dynamic> json) =>
      _$ItemFromJson(getStartWithString_('item', json));

  static Item? schemaToJson(Map<String, dynamic> json) {
    bool valid = true;

    for (String i in json.keys) {
      if (!schemaMap.contains(i)) {
        valid = false;
        break;
      }
    }

    if (valid) {
      return _$ItemFromJson(json);
    }
  }

  static Item? filterFromJson(Map<String, dynamic> json) =>
      schemaToJson(getStartWithString_('item', json));
}

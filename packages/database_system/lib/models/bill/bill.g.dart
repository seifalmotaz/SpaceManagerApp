// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bill _$BillFromJson(Map<String, dynamic> json) => Bill(
      id: json['id'] as int,
      guestId: json['guest_id'] as int,
      takedCount: json['taked_count'] as int,
      itemId: json['item_id'] as int,
      createdDate: DataCompiler.fromDBDateNull(json['created_date'] as int?),
    );

Map<String, dynamic> _$BillToJson(Bill instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'taked_count': instance.takedCount,
    'guest_id': instance.guestId,
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

class BillQuery {
  final Database db;
  BillQuery(this.db);

  Future<int> create({
    required int takedCount,
    required int guestId,
    required int itemId,
    DateTime? createdDate,
  }) async =>
      await db.insert('bill', {
        if (takedCount != null) 'taked_count': takedCount,
        if (guestId != null) 'guest_id': guestId,
        if (itemId != null) 'item_id': itemId,
        if (createdDate != null)
          'created_date':
              (createdDate.millisecondsSinceEpoch / 1000).round() as int,
      });

  Future<Bill> read(int id) async {
    List<Map<String, dynamic>> data = await db.query(
      'bill',
      where: 'id = ?',
      whereArgs: [id],
    );
    return Bill.fromJson(data.first);
  }

  Future<int> update({
    required int id,
    int? takedCount,
    int? guestId,
    int? itemId,
    DateTime? createdDate,
  }) async =>
      await db.update(
        'bill',
        {
          if (takedCount != null) 'taked_count': takedCount,
          if (guestId != null) 'guest_id': guestId,
          if (itemId != null) 'item_id': itemId,
          if (createdDate != null)
            'created_date':
                (createdDate.millisecondsSinceEpoch / 1000).round() as int,
        },
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<int> delete(int id) async => await db.delete(
        'bill',
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<List<Bill>> find({
    int? takedCount,
    int? guestId,
    int? itemId,
    DateTime? createdDate,
  }) async {
    List<String> searchFields = [];
    if (takedCount != null) {
      searchFields.add("bill.taked_count = ?");
    }
    if (guestId != null) {
      searchFields.add("bill.guest_id = ?");
    }
    if (itemId != null) {
      searchFields.add("bill.item_id = ?");
    }
    if (createdDate != null) {
      searchFields.add("bill.created_date = ?");
    }

    StringBuffer buf = StringBuffer();
    for (int i = 0; i < searchFields.length; i++) {
      if (i == 0) buf.writeln(searchFields[i]);
      if (i != 0) buf.writeln("AND " + searchFields[i]);
    }

    List<Map<String, dynamic>> data = await db.query(
      'bill',
      where: '''
          ${buf.toString()}
          ${buf.toString().isNotEmpty ? "AND" : ""} ${BillTable.sqlFindSchema}
          ''',
      whereArgs: [
        if (takedCount != null) takedCount,
        if (guestId != null) guestId,
        if (itemId != null) itemId,
        if (createdDate != null)
          (createdDate.millisecondsSinceEpoch / 1000).round() as int,
      ],
    );

    return data.map((e) => Bill.fromJson(e)).toList();
  }
}

// **************************************************************************
// Generator: SqlFieldsGen
// **************************************************************************

extension BillTable on Bill {
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
  static String nativeId = 'bill.id';

  /// Field data: field ///
  static String takedCount = 'taked_count';
  static String nativeTakedCount = 'bill.taked_count';

  /// Field data: field ///
  static String guestId = 'guest_id';
  static String nativeGuestId = 'bill.guest_id';

  /// Field data: field ///
  static String itemId = 'item_id';
  static String nativeItemId = 'bill.item_id';

  /// Field data: field ///
  static String createdDate = 'created_date';
  static String nativeCreatedDate = 'bill.created_date';

  static const String sqlSelect = """
    bill.id AS bill_id,
    bill.taked_count AS bill_taked_count,
    bill.guest_id AS bill_guest_id,
    bill.item_id AS bill_item_id,
    bill.created_date AS bill_created_date
  """;

  static const String sqlFindSchema = """
    bill.id IS NOT NULL
    AND bill.taked_count IS NOT NULL
    AND bill.guest_id IS NOT NULL
    AND bill.item_id IS NOT NULL
  """;

  static const List schemaMap = [
    'id',
    'taked_count',
    'guest_id',
    'item_id',
    'created_date',
  ];

  static fromJson(Map<String, dynamic> json) =>
      _$BillFromJson(getStartWithString_('bill', json));

  static Bill? schemaToJson(Map<String, dynamic> json) {
    bool valid = true;

    for (String i in json.keys) {
      if (!schemaMap.contains(i)) {
        valid = false;
        break;
      }
    }

    if (valid) {
      return _$BillFromJson(json);
    }
  }

  static Bill? filterFromJson(Map<String, dynamic> json) =>
      schemaToJson(getStartWithString_('bill', json));
}

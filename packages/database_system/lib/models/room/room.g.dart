// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      id: json['id'] as int,
      name: json['name'] as String,
      rate: (json['rate'] as num).toDouble(),
      capacity: json['capacity'] as int,
      isDeleted: DataCompiler.fromDBoolNull(json['is_deleted'] as int?),
    );

Map<String, dynamic> _$RoomToJson(Room instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'rate': instance.rate,
    'name': instance.name,
    'capacity': instance.capacity,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('is_deleted', DataCompiler.toDBoolNull(instance.isDeleted));
  return val;
}

// **************************************************************************
// Generator: QuerysGen
// **************************************************************************

class RoomQuery {
  final Database db;
  RoomQuery(this.db);

  Future<int> create({
    required double rate,
    required String name,
    required int capacity,
    bool? isDeleted,
  }) async =>
      await db.insert('room', {
        if (rate != null) 'rate': rate,
        if (name != null) 'name': name,
        if (capacity != null) 'capacity': capacity,
        if (isDeleted != null) 'is_deleted': isDeleted ? 1 : 0,
      });

  Future<Room> read(int id) async {
    List<Map<String, dynamic>> data = await db.query(
      'room',
      where: 'id = ?',
      whereArgs: [id],
    );
    return Room.fromJson(data.first);
  }

  Future<int> update({
    required int id,
    double? rate,
    String? name,
    int? capacity,
    bool? isDeleted,
  }) async =>
      await db.update(
        'room',
        {
          if (rate != null) 'rate': rate,
          if (name != null) 'name': name,
          if (capacity != null) 'capacity': capacity,
          if (isDeleted != null) 'is_deleted': isDeleted ? 1 : 0,
        },
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<int> delete(int id) async => await db.delete(
        'room',
        where: 'id = ?',
        whereArgs: [id],
      );

  Future<List<Room>> find({
    double? rate,
    String? name,
    int? capacity,
    bool? isDeleted,
  }) async {
    List<String> searchFields = [];
    if (rate != null) {
      searchFields.add("room.rate = ?");
    }
    if (name != null) {
      searchFields.add("room.name = ?");
    }
    if (capacity != null) {
      searchFields.add("room.capacity = ?");
    }
    if (isDeleted != null) {
      searchFields.add("room.is_deleted = ?");
    }

    StringBuffer buf = StringBuffer();
    for (int i = 0; i < searchFields.length; i++) {
      if (i == 0) buf.writeln(searchFields[i]);
      if (i != 0) buf.writeln("AND " + searchFields[i]);
    }

    List<Map<String, dynamic>> data = await db.query(
      'room',
      where:
          '''
          ${buf.toString()}
          ${buf.toString().isNotEmpty ? "AND" : ""} ${RoomTable.sqlFindSchema}
          ''',
      whereArgs: [
        if (rate != null) rate,
        if (name != null) name,
        if (capacity != null) capacity,
        if (isDeleted != null) isDeleted ? 1 : 0,
      ],
    );

    return data.map((e) => Room.fromJson(e)).toList();
  }
}

// **************************************************************************
// Generator: SqlFieldsGen
// **************************************************************************

extension RoomTable on Room {
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
  static String nativeId = 'room.id';

  /// Field data: field ///
  static String rate = 'rate';
  static String nativeRate = 'room.rate';

  /// Field data: field ///
  static String name = 'name';
  static String nativeName = 'room.name';

  /// Field data: field ///
  static String capacity = 'capacity';
  static String nativeCapacity = 'room.capacity';

  /// Field data: field ///
  static String isDeleted = 'is_deleted';
  static String nativeIsDeleted = 'room.is_deleted';

  static const String sqlSelect =
      """
    room.id AS room_id,
    room.rate AS room_rate,
    room.name AS room_name,
    room.capacity AS room_capacity,
    room.is_deleted AS room_is_deleted
  """;

  static const String sqlFindSchema =
      """
    room.id IS NOT NULL
    AND room.rate IS NOT NULL
    AND room.name IS NOT NULL
    AND room.capacity IS NOT NULL
  """;

  static const List schemaMap = [
    'id',
    'rate',
    'name',
    'capacity',
    'is_deleted',
  ];

  static fromJson(Map<String, dynamic> json) =>
      _$RoomFromJson(getStartWithString_('room', json));

  static Room? schemaToJson(Map<String, dynamic> json) {
    bool valid = true;

    for (String i in json.keys) {
      if (!schemaMap.contains(i)) {
        valid = false;
        break;
      }
    }

    if (valid) {
      return _$RoomFromJson(json);
    }
  }

  static Room? filterFromJson(Map<String, dynamic> json) =>
      schemaToJson(getStartWithString_('room', json));
}

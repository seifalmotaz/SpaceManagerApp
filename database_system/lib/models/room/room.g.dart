// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      id: json['id'] as int,
      isDeleted: DataCompiler.fromDBool(json['is_deleted'] as int),
      name: json['name'] as String,
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'id': instance.id,
      'rate': instance.rate,
      'name': instance.name,
      'is_deleted': DataCompiler.toDBool(instance.isDeleted),
    };

// **************************************************************************
// Generator: QuerysGen
// **************************************************************************

// hello

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
  static String isDeleted = 'is_deleted';
  static String nativeIsDeleted = 'room.is_deleted';

  static const String sqlSelect = """
    room.id AS room_id,
    room.rate AS room_rate,
    room.name AS room_name,
    room.is_deleted AS room_is_deleted,
  """;

  static fromJson(Map<String, dynamic> json) =>
      _$RoomFromJson(getStartWithString_('room', json));
}

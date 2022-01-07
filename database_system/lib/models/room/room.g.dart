// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Room _$$_RoomFromJson(Map<String, dynamic> json) => _$_Room(
      id: json['id'] as int?,
      rate: (json['rate'] as num?)?.toDouble(),
      name: json['name'] as String?,
      isDeleted: DataCompiler.fromDBool(json['is_deleted'] as int?),
    );

Map<String, dynamic> _$$_RoomToJson(_$_Room instance) => <String, dynamic>{
      'id': instance.id,
      'rate': instance.rate,
      'name': instance.name,
      'is_deleted': DataCompiler.toDBool(instance.isDeleted),
    };

// **************************************************************************
// EngineSQLGenerator
// **************************************************************************

extension RoomFieldsSQL on RoomFields {
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
  static String nativeId = 'room.id';
  static String id = 'id';
// \ // \ End: id // \ // \
// \ // \ Start: rate // \ // \
  static String nativeRate = 'room.rate';
  static String rate = 'rate';
// \ // \ End: rate // \ // \
// \ // \ Start: name // \ // \
  static String nativeName = 'room.name';
  static String name = 'name';
// \ // \ End: name // \ // \
// \ // \ Start: isDeleted // \ // \
  static String nativeIsDeleted = 'room.is_deleted';
  static String isDeleted = 'is_deleted';
// \ // \ End: isDeleted // \ // \

  static fromJson(Map<String, dynamic> json) =>
      _$$_RoomFromJson(getStartWithString_('room', json));
}
